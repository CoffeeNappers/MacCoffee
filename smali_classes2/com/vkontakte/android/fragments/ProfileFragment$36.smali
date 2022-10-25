.class synthetic Lcom/vkontakte/android/fragments/ProfileFragment$36;
.super Ljava/lang/Object;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vkontakte$android$api$ExtendedUserProfile$Deactivated:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 1106
    invoke-static {}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->values()[Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$36;->$SwitchMap$com$vkontakte$android$api$ExtendedUserProfile$Deactivated:[I

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$36;->$SwitchMap$com$vkontakte$android$api$ExtendedUserProfile$Deactivated:[I

    sget-object v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->Banned:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$36;->$SwitchMap$com$vkontakte$android$api$ExtendedUserProfile$Deactivated:[I

    sget-object v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->Deleted:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
