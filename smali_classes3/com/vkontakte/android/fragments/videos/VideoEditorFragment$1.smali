.class Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "VideoEditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->onDone()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

.field final synthetic val$description:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->val$description:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 248
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->val$title:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 249
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->val$description:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    .line 250
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v2, v2, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    iput-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    .line 251
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v2, v2, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    iput-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    .line 253
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 254
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "video"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 255
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 256
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 257
    return-void
.end method
