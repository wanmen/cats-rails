# user role
BLACKLIST = -1
BEGINNER = 0
PRESCHOLAR = 1
SCHOLAR = 2
PREADMIN = 3
ADMIN = 4
SUPERADMIN = 9

BOOKLIST = 1
VIDEOLIST = 2
ARTICLELIST = 3
MIXLIST = 4

# constants for privilege control
PRIVILEGETYPE_BOOK = 1
PRIVILEGETYPE_VIDEO = 2
PRIVILEGETYPE_ARTICLE = 3
PRIVILEGETYPE_BOOKLIST = 4
PRIVILEGETYPE_VIDEOLIST = 5
PRIVILEGETYPE_ARTICLELIST = 6
PRIVILEGETYPE_MIXLIST = 7
PRIVILEGETYPE_LIST = 8


# privilege control
# { item_type => { method_name => [ 'minimum_access', 'refuse_access_massage' ] } }
PRIVILEGE = {
    PRIVILEGETYPE_BOOK => {
        'new' => [SCHOLAR, '您没有权限创建新书'],
        'create' => [SCHOLAR, '您没有权限创建新书'],
        'edit' => [SCHOLAR, '您没有权限编辑此书'],
        'update' => [SCHOLAR, '您没有权限编辑此书'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_VIDEO => {
        'new' => [SUPERADMIN, '您没有权限创建视频'],
        'create' => [SUPERADMIN, '您没有权限创建视频'],
        'edit' => [SUPERADMIN, '您没有权限编辑此视频'],
        'update' => [SUPERADMIN, '您没有权限编辑此视频'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_ARTICLE => {
        'new' => [SUPERADMIN, '您没有权限创建经验贴'],
        'create' => [SUPERADMIN, '您没有权限创建经验贴'],
        'edit' => [SUPERADMIN, '您没有权限编辑此经验贴'],
        'update' => [SUPERADMIN, '您没有权限编辑此经验贴'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_BOOKLIST => {
        'new' => [SCHOLAR, '您没有权限创建书单'],
        'create' => [SCHOLAR, '您没有权限创建书单'],
        'edit' => [SCHOLAR, '您没有权限编辑书单'],
        'update' => [SCHOLAR, '您没有权限编辑书单'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_VIDEOLIST => {
        'new' => [SCHOLAR, '您没有权限创建视频集'],
        'create' => [SUPERADMIN, '您没有权限创建视频集'],
        'edit' => [SUPERADMIN, '您没有权限编辑此视频集'],
        'update' => [SUPERADMIN, '您没有权限编辑此视频集'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_ARTICLELIST => {
        'new' => [SCHOLAR, '您没有权限创建经验贴集'],
        'create' => [SUPERADMIN, '您没有权限创建经验贴集'],
        'edit' => [SUPERADMIN, '您没有权限编辑此经验贴集'],
        'update' => [SUPERADMIN, '您没有权限编辑此经验贴集'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_MIXLIST => {
        'new' => [SCHOLAR, '您没有权限创建综合集'],
        'create' => [SUPERADMIN, '您没有权限创建综合集'],
        'edit' => [SUPERADMIN, '您没有权限编辑此综合集'],
        'update' => [SUPERADMIN, '您没有权限编辑此综合集'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
    },
    PRIVILEGETYPE_LIST => {
        'new' => [SCHOLAR, '您没有权限创建集合'],
        'create' => [SCHOLAR, '您没有权限创建集合'],
        'edit' => [SCHOLAR, '您没有权限编辑集合'],
        'update' => [SCHOLAR, '您没有权限编辑集合'],
        'destroy' => [SUPERADMIN, '您没有权限执行此操作']
},

}