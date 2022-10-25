.class Lcom/vk/stories/StoryPrivacySettingsActivity$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "StoryPrivacySettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryPrivacySettingsActivity;->loadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/data/PrivacySection;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryPrivacySettingsActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryPrivacySettingsActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 80
    iget-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-virtual {v0}, Lcom/vk/stories/StoryPrivacySettingsActivity;->finish()V

    .line 81
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 49
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/PrivacySection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PrivacySection;>;"
    iget-object v3, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/vk/stories/StoryPrivacySettingsActivity;->access$002(Lcom/vk/stories/StoryPrivacySettingsActivity;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 54
    if-eqz p1, :cond_1

    .line 55
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 56
    const-string/jumbo v4, "stories"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySection;

    iget-object v3, v3, Lcom/vkontakte/android/data/PrivacySection;->key:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySection;

    iget-object v3, v3, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySection;

    iget-object v3, v3, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 57
    iget-object v3, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-static {v3}, Lcom/vk/stories/StoryPrivacySettingsActivity;->access$100(Lcom/vk/stories/StoryPrivacySettingsActivity;)Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 59
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 60
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v4, "setting"

    new-instance v5, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySection;

    iget-object v3, v3, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v5, v3}, Lcom/vkontakte/android/data/PrivacySetting;-><init>(Lcom/vkontakte/android/data/PrivacySetting;)V

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 62
    new-instance v1, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;

    invoke-direct {v1}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;-><init>()V

    .line 63
    .local v1, "fragment":Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;
    invoke-virtual {v1, v0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 65
    iget-object v3, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-static {v3, v1}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Landroid/app/Fragment;)Landroid/app/Fragment;

    .line 75
    .end local v0    # "args":Landroid/os/Bundle;
    .end local v1    # "fragment":Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;
    .end local v2    # "i":I
    :goto_1
    return-void

    .line 55
    .restart local v2    # "i":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 73
    .end local v2    # "i":I
    :cond_1
    iget-object v3, p0, Lcom/vk/stories/StoryPrivacySettingsActivity$1;->this$0:Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-virtual {v3}, Lcom/vk/stories/StoryPrivacySettingsActivity;->finish()V

    goto :goto_1
.end method
