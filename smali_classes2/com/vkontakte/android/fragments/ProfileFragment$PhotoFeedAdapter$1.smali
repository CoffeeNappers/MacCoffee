.class Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;
.super Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)V
    .locals 1
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    .prologue
    .line 3993
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 6

    .prologue
    .line 3997
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4004
    :goto_0
    return-void

    .line 4000
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    new-instance v1, Lcom/vkontakte/android/PhotoViewer;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->access$6800(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v3

    invoke-virtual {v3}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->access$6900(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v4

    invoke-virtual {v4}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->item:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6702(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/PhotoViewer;

    .line 4001
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 4002
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    :goto_2
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/PhotoViewer;->setDisplayTotal(I)V

    .line 4003
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto/16 :goto_0

    .line 4001
    :cond_1
    const v0, 0x7f0800ca

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 4002
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    const-string/jumbo v2, "photos"

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v0

    goto :goto_2
.end method
