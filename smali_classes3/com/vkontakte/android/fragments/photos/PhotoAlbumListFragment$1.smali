.class Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "PhotoAlbumListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v5, 0x78

    const/high16 v9, 0x40000000    # 2.0f

    const/4 v8, 0x0

    .line 88
    const-string/jumbo v4, "com.vkontakte.android.PHOTO_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 89
    const-string/jumbo v4, "aid"

    invoke-virtual {p2, v4, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 90
    .local v0, "aid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$000(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/PhotoAlbum;

    .line 91
    .local v1, "album":Lcom/vkontakte/android/api/PhotoAlbum;
    iget v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v4, :cond_0

    .line 92
    iget v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 93
    iget-boolean v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->thumbIsLast:Z

    if-eqz v4, :cond_3

    .line 94
    const/16 v2, 0x70

    .line 95
    .local v2, "needSize":C
    sget v4, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v7, 0x3fc00000    # 1.5f

    cmpl-float v4, v4, v7

    if-ltz v4, :cond_1

    .line 96
    const/16 v2, 0x71

    .line 98
    :cond_1
    sget v4, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v4, v4, v9

    if-ltz v4, :cond_2

    .line 99
    const/16 v2, 0x72

    .line 101
    :cond_2
    const-string/jumbo v4, "photo"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Photo;

    .line 102
    .local v3, "photo":Lcom/vkontakte/android/Photo;
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 103
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    iput-object v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->thumbURL:Ljava/lang/String;

    .line 108
    .end local v2    # "needSize":C
    .end local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_3
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$200(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;

    move-result-object v4

    iget-object v7, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v7}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$100(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v4, v7}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;->notifyItemChanged(I)V

    goto :goto_0

    .line 105
    .restart local v2    # "needSize":C
    .restart local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_4
    sget v4, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v4, v4, v9

    if-ltz v4, :cond_5

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isHighSpeed()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    if-eqz v4, :cond_5

    move v4, v5

    :goto_2
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    iput-object v4, v1, Lcom/vkontakte/android/api/PhotoAlbum;->thumbURL:Ljava/lang/String;

    goto :goto_1

    :cond_5
    const/16 v4, 0x6d

    goto :goto_2

    .line 112
    .end local v0    # "aid":I
    .end local v1    # "album":Lcom/vkontakte/android/api/PhotoAlbum;
    .end local v2    # "needSize":C
    .end local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_6
    const-string/jumbo v4, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 113
    const-string/jumbo v4, "aid"

    invoke-virtual {p2, v4, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 114
    .restart local v0    # "aid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$300(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/PhotoAlbum;

    .line 115
    .restart local v1    # "album":Lcom/vkontakte/android/api/PhotoAlbum;
    iget v5, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v5, :cond_7

    .line 116
    iget v5, v1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 117
    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$200(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$400(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;->notifyItemChanged(I)V

    goto :goto_3

    .line 121
    .end local v0    # "aid":I
    .end local v1    # "album":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_8
    const-string/jumbo v4, "com.vkontakte.android.UPDATE_ALBUM_COVER"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 122
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    const-string/jumbo v5, "aid"

    invoke-virtual {p2, v5, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    const-string/jumbo v6, "new_cover_url"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->setCover(ILjava/lang/String;)V

    .line 124
    :cond_9
    return-void
.end method
