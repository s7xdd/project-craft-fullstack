AGENTS.md - Development Guidelines for project-craft-client
This document outlines the development, testing, and coding standards for the project-craft-client repository, focusing on PHP (Laravel), HTML, CSS, and vanilla JavaScript. These guidelines ensure high code quality, maintainability, security, and production readiness. All developers must adhere to these standards to maintain consistency and scalability.
Test and Lint Commands
Testing

Run All Tests:
Command: php artisan test or vendor/bin/phpunit
Description: Executes the full test suite, including unit and feature tests, using PHPUnit.
Coverage: Aim for at least 80% test coverage for critical paths (use vendor/bin/phpunit --coverage to verify).


Run Single Test:
Command: php artisan test --filter=TestName or vendor/bin/phpunit --filter=TestName
Description: Runs a specific test class or method for targeted testing.


Test Organization:
Place unit tests in tests/Unit/.
Place feature/integration tests in tests/Feature/.
Use descriptive test names (e.g., testUserCanRegisterWithValidCredentials).



Linting and Formatting

PHP:
Command: vendor/bin/pint
Description: Enforces consistent PHP code style using Laravel Pint, based on PSR-12 standards.
Pre-commit: Run vendor/bin/pint --test to verify formatting before committing.



Code Style Guidelines
PHP/Laravel

Imports:
Use fully qualified namespaced imports at the top of files.
Group imports by type (e.g., PHP core, Laravel, third-party, local) with a single blank line between groups.
Example:use Illuminate\Http\Request;
use App\Models\User;

use Carbon\Carbon;




Naming:
Classes: PascalCase (e.g., UserController).
Methods/Properties/Variables: camelCase (e.g., getUserData, $userName).
Database Tables: snake_case, plural (e.g., user_profiles).
Constants: UPPER_SNAKE_CASE (e.g., MAX_LOGIN_ATTEMPTS).


Types:
Use PHP 8.1+ type hints for all parameters, return types, and properties where applicable.
Prefer strict types: Add declare(strict_types=1); at the top of every PHP file.
Example:declare(strict_types=1);

public function updateUser(Request $request, User $user): JsonResponse
{
    // ...
}




Formatting:
Run vendor/bin/pint to enforce PSR-12 standards.
Avoid inline comments; prefer descriptive method/variable names or block comments for complex logic.


Error Handling:
Use Laravel’s built-in exception handling (try/catch) for expected errors.
Leverage Laravel’s validation for all user inputs (e.g., Validator or Form Requests).
Return meaningful HTTP status codes and error messages in API responses.
Example:public function store(Request $request): JsonResponse
{
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users',
    ]);

    try {
        $user = User::create($validated);
        return response()->json($user, 201);
    } catch (Exception $e) {
        return response()->json(['error' => 'Failed to create user'], 500);
    }
}





HTML

Standards:
Write semantic HTML5, using appropriate tags (e.g., <nav>, <article>, <section>).
Ensure accessibility (a11y) by including ARIA attributes where necessary.
Example:<nav aria-label="Main navigation">
    <ul>
        <li><a href="/home" aria-current="page">Home</a></li>
        <li><a href="/profile">Profile</a></li>
    </ul>
</nav>




Validation: Validate HTML using tools like W3C Markup Validator before deployment.
Blade Templates:
Use Laravel Blade for templating, keeping logic minimal.
Organize templates in resources/views/ with subdirectories for modules (e.g., resources/views/auth/).
Example:@extends('layouts.app')

@section('content')
    <h1>Welcome, {{ $user->name }}</h1>
@endsection





CSS

Standards:
Use BEM (Block-Element-Modifier) for class naming or adopt a utility-first approach if using a framework like Tailwind CSS (if included in the project).
Example (BEM):.button {}
.button__icon {}
.button--primary {}




Organization:
Place styles in public/css/ or resources/css/.
Use separate files for each module (e.g., auth.css, dashboard.css).


Responsive Design:
Use relative units (e.g., rem, vw, %) for responsive layouts.
Test across devices and browsers (Chrome, Firefox, Safari, Edge).


Performance:
Minimize CSS file size by removing unused styles.
Avoid !important unless absolutely necessary.



JavaScript

Standards:
Write vanilla JavaScript, avoiding external dependencies like jQuery.
Follow ECMAScript 2020+ standards for modern syntax.
Example:document.querySelector('.submit-button').addEventListener('click', (event) => {
    event.preventDefault();
    const form = event.target.closest('form');
    form.submit();
});




Organization:
Place scripts in public/js/ or resources/js/.
Use separate files for each module (e.g., auth.js, dashboard.js).


Error Handling:
Use try/catch for asynchronous operations (e.g., fetch).
Provide user-friendly error messages in the UI.
Example:async function fetchUserData(userId) {
    try {
        const response = await fetch(`/api/users/${userId}`);
        if (!response.ok) throw new Error('Failed to fetch user');
        return await response.json();
    } catch (error) {
        console.error(error);
        alert('An error occurred while fetching user data.');
    }
}




Security: Sanitize user inputs to prevent XSS attacks (e.g., avoid innerHTML for user-generated content).

General

Indentation: 4 spaces for PHP and HTML; 2 spaces for CSS and JavaScript.
Encoding: UTF-8 for all files.
Line Endings: Use LF (\n) for all files.
Final Newline: Ensure every file ends with a single newline.
Trailing Whitespace: Trim all trailing whitespace before committing.
Documentation:
Use PHPDoc for PHP classes, methods, and complex functions.
Use JSDoc for JavaScript functions.
Example (PHP):/**
 * Retrieve a user by their ID.
 *
 * @param int $id
 * @return User
 * @throws ModelNotFoundException
 */
public function getUserById(int $id): User
{
    return User::findOrFail($id);
}


Example (JavaScript):/**
 * Toggle visibility of a DOM element.
 * @param {string} selector - The CSS selector for the element.
 * @param {boolean} show - Whether to show or hide the element.
 */
function toggleElement(selector, show) {
    document.querySelector(selector).style.display = show ? 'block' : 'none';
}





File Structure

Follow Laravel’s MVC conventions:
Controllers: app/Http/Controllers/ (e.g., UserController.php).
Models: app/Models/ (e.g., User.php).
Requests: app/Http/Requests/ (e.g., StoreUserRequest.php).
Resources: app/Http/Resources/ for API resource transformations.
Tests: tests/Unit/ for unit tests, tests/Feature/ for integration tests.
Frontend:
HTML/Blade: resources/views/ (e.g., resources/views/auth/login.blade.php).
CSS: public/css/ or resources/css/ (e.g., public/css/app.css).
JavaScript: public/js/ or resources/js/ (e.g., public/js/app.js).




Use domain-driven subdirectories for large modules (e.g., app/Domains/Auth/).

Security

Secrets Management:
Never commit sensitive data (e.g., API keys, passwords) to the repository.
Store secrets in .env and reference them via env() or config().
Ensure .env is listed in .gitignore.


Input Validation:
Use Laravel Form Requests or Validator for all user inputs.
Sanitize inputs to prevent XSS and SQL injection.
Example:$request->validate([
    'email' => 'required|email|unique:users,email',
    'content' => 'required|string|max:1000|regex:/^[a-zA-Z0-9\s]*$/',
]);




Authentication/Authorization:
Use Laravel’s built-in authentication (e.g., auth() middleware).
Implement role-based access control (RBAC) with Laravel Gate or Spatie’s Permission package.


CSRF and CORS:
Ensure CSRF tokens are included in all non-API forms (@csrf in Blade).
Configure CORS for APIs in config/cors.php.


Database Security:
Use Eloquent or Query Builder to prevent SQL injection.
Avoid raw SQL queries unless absolutely necessary.


Frontend Security:
Use textContent instead of innerHTML for user inputs in JavaScript.
Validate and sanitize inputs on both client and server sides.



Version Control

Branching:
Use main for production-ready code.
Create feature branches (feature/<feature-name>) or bugfix branches (bugfix/<issue-id>).


Commits:
Write clear, concise commit messages (e.g., Add user authentication middleware).
Follow Conventional Commits for automation (e.g., feat: add user profile endpoint).


Pull Requests:
Include a description of changes, referencing any issues.
Ensure all tests pass and linting is clean before merging.
Require at least one reviewer approval.



Performance

Database:
Use eager loading to avoid N+1 query issues (e.g., User::with('roles')->get()).
Index frequently queried columns in the database.


Frontend:
Minimize CSS and JavaScript file sizes by removing unused code.
Defer non-critical JavaScript using <script defer>.
Optimize images (e.g., use WebP format, compress before upload).


Caching:
Use Laravel’s caching (e.g., Redis, Memcached) for expensive queries.
Cache Blade views or API responses where applicable.



Continuous Integration

Pipeline:
Use GitHub Actions or similar for CI/CD.
Run vendor/bin/pint --test and php artisan test on every push.


Deployment:
Deploy to staging for testing before production.
Use zero-downtime deployment strategies (e.g., Laravel Envoyer).



Additional Guidelines

Code Reviews: All code must be reviewed by at least one team member to catch potential issues.
Documentation:
Maintain API documentation using OpenAPI/Swagger or Laravel API Docs.
Update README.md with setup instructions and project overview.


Error Monitoring:
Integrate tools like Sentry or Laravel Telescope for real-time error tracking.


Dependencies:
Keep PHP dependencies up to date using composer update.
Avoid unnecessary dependencies to minimize security risks.



By following these guidelines, the project-craft-client codebase will remain consistent, secure, and production-ready. For questions or clarifications, reach out to the development team.