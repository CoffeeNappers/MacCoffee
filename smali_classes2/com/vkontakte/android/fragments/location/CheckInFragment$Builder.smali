.class Lcom/vkontakte/android/fragments/location/CheckInFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "CheckInFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 73
    const-class v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;

    new-instance v1, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v2, 0x11

    .line 74
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/16 v2, 0x10

    .line 75
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setInputMode(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x44340000    # 720.0f

    .line 76
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x42000000    # 32.0f

    .line 78
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const v2, 0x106000b

    .line 79
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    .line 73
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V

    .line 81
    return-void
.end method
