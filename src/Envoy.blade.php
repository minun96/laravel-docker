@servers(['web' => 'envoytest'])

@task('deploy')
    cd /path/to/site
    git pull origin master
@endtask
