.class Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "EditAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 187
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$100(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 188
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$200(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->descr:Ljava/lang/String;

    .line 189
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$300(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v1, v1, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    iput-object v1, v2, Lcom/vkontakte/android/api/PhotoAlbum;->privacy:Ljava/util/List;

    .line 190
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$400(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v1, v1, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    iput-object v1, v2, Lcom/vkontakte/android/api/PhotoAlbum;->privacyComment:Ljava/util/List;

    .line 191
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$500(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/CheckBox;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    iput-boolean v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->canUpload:Z

    .line 192
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$600(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/CheckBox;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    iput-boolean v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->commentsDisabled:Z

    .line 193
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 194
    .local v0, "r":Landroid/content/Intent;
    const-string/jumbo v1, "album"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 195
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 196
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 197
    return-void
.end method
