.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 109
    const-string/jumbo v4, "com.vkontakte.android.PHOTO_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 110
    const-string/jumbo v4, "aid"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 111
    .local v0, "aid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v4, v4, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v4, :cond_0

    .line 112
    const-string/jumbo v4, "photo"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo;

    .line 113
    .local v2, "photo":Lcom/vkontakte/android/Photo;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$000(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    .line 115
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v4, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, v4, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 116
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->updateList()V

    .line 124
    .end local v0    # "aid":I
    .end local v2    # "photo":Lcom/vkontakte/android/Photo;
    :cond_0
    const-string/jumbo v4, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 125
    const-string/jumbo v4, "aid"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 126
    .restart local v0    # "aid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v4, v4, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v4, :cond_3

    .line 127
    const-string/jumbo v4, "pid"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 128
    .local v3, "pid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo;

    .line 129
    .restart local v2    # "photo":Lcom/vkontakte/android/Photo;
    iget v5, v2, Lcom/vkontakte/android/Photo;->id:I

    if-ne v5, v3, :cond_1

    .line 130
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 131
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v4, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 136
    .end local v2    # "photo":Lcom/vkontakte/android/Photo;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    .line 137
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->updateList()V

    .line 138
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->onPhotoRemoved()V

    .line 141
    .end local v0    # "aid":I
    .end local v3    # "pid":I
    :cond_3
    const-string/jumbo v4, "com.vkontakte.android.UPDATE_PHOTO"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 142
    const-string/jumbo v4, "aid"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 143
    .restart local v0    # "aid":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v4, v4, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v4, :cond_4

    .line 144
    const-string/jumbo v4, "photo"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo;

    .line 145
    .restart local v2    # "photo":Lcom/vkontakte/android/Photo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_4

    .line 146
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$500(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    iget v4, v4, Lcom/vkontakte/android/Photo;->id:I

    iget v5, v2, Lcom/vkontakte/android/Photo;->id:I

    if-ne v4, v5, :cond_5

    .line 147
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$600(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    iget-object v5, v2, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    iput-object v5, v4, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    .line 148
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$700(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    iget v5, v2, Lcom/vkontakte/android/Photo;->nLikes:I

    iput v5, v4, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 149
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$800(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    iget-boolean v5, v2, Lcom/vkontakte/android/Photo;->isLiked:Z

    iput-boolean v5, v4, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 150
    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$900(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    iget v5, v2, Lcom/vkontakte/android/Photo;->nReposts:I

    iput v5, v4, Lcom/vkontakte/android/Photo;->nReposts:I

    .line 163
    .end local v0    # "aid":I
    .end local v1    # "i":I
    .end local v2    # "photo":Lcom/vkontakte/android/Photo;
    :cond_4
    return-void

    .line 145
    .restart local v0    # "aid":I
    .restart local v1    # "i":I
    .restart local v2    # "photo":Lcom/vkontakte/android/Photo;
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
