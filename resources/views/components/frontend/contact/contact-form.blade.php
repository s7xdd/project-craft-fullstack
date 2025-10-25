@props([
    'action' => route('contact.submit')
])

<section class="py-16">
    <div class="container mx-auto px-4">
        <div class="bg-white border border-gray-200 rounded-lg shadow-sm">
            <div class="p-8 md:p-12">
                <div class="max-w-4xl mx-auto">
                    <form method="post" action="{{ $action }}" id="contact-form">
                        @csrf
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">First Name</label>
                                <input type="text" name="firstName" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors" placeholder="" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Last Name</label>
                                <input type="text" name="lastName" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors" placeholder="" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">E-mail</label>
                                <input type="email" name="email" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors" placeholder="" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Phone</label>
                                <input type="text" name="phone" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors" placeholder="">
                            </div>
                        </div>
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Subject</label>
                            <input type="text" name="subject" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors" placeholder="" required>
                        </div>
                        <div class="mb-8">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Write Message *</label>
                            <textarea name="message" rows="6" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors resize-none" placeholder="" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="bg-black text-white px-8 py-3 rounded-lg font-semibold hover:bg-gray-800 transition-colors" name="submit-form">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>