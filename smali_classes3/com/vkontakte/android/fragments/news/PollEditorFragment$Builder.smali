.class public Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PollEditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/news/PollEditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 3

    .prologue
    .line 50
    const-class v0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;

    new-instance v1, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v2, 0x11

    .line 51
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/16 v2, 0x10

    .line 52
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setInputMode(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x44340000    # 720.0f

    .line 53
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x42000000    # 32.0f

    .line 54
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const v2, 0x106000b

    .line 55
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    .line 50
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V

    .line 57
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public attachPoll(Lcom/vkontakte/android/attachments/PollAttachment;)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
    .locals 2
    .param p1, "poll"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "poll"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 66
    return-object p0
.end method

.method setOwnerId(I)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
    .locals 2
    .param p1, "ownerId"    # I

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 61
    return-object p0
.end method
