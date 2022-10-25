.class Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "GeoPlaceFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 72
    const-class v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    new-instance v1, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v2, 0x11

    .line 73
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/16 v2, 0x10

    .line 74
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setInputMode(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x44340000    # 720.0f

    .line 75
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x42000000    # 32.0f

    .line 76
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const v2, 0x106000b

    .line 77
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    .line 72
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V

    .line 81
    return-void
.end method


# virtual methods
.method public checkin(Z)Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;
    .locals 2
    .param p1, "checkin"    # Z

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "checkin"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    return-object p0
.end method

.method public point(Lcom/vkontakte/android/attachments/GeoAttachment;)Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;
    .locals 2
    .param p1, "att"    # Lcom/vkontakte/android/attachments/GeoAttachment;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "point"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 85
    return-object p0
.end method
