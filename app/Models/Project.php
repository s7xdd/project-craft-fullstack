<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;

class Project extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'subtitle', 'sort_order', 'slug', 'image', 'photos', 'highlights', 'tags', 'completion_status', 'status', 'parent_id'];

    public function getTranslation($field = '', $lang = false)
    {
        $lang = $lang == false ? App::getLocale() : $lang;
        $project_translation = $this->project_translations->where('lang', $lang)->first();
        return $project_translation != null ? $project_translation->$field : $this->$field;
    }

    public function project_translations()
    {
        return $this->hasMany(ProjectTranslation::class);
    }

    public function parent()
    {
        return $this->belongsTo(Project::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Project::class, 'parent_id');
    }
}
