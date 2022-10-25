.class public Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;
.super Lcom/vkontakte/android/UserProfile;
.source "GiftsGet.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/gifts/GiftsGet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserProfile"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public can_see_gifts:Z

.field public first_name_gen:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    new-instance v0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v0, 0x1

    .line 60
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 61
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    .line 62
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    .line 63
    return-void

    .line 61
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 66
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 67
    const-string/jumbo v1, "can_see_gifts"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    .line 68
    const-string/jumbo v0, "first_name_gen"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    .line 69
    return-void

    .line 67
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lcom/vkontakte/android/UserProfile;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 74
    iget-boolean v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 76
    return-void

    .line 74
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
