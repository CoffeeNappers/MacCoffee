.class final Lcom/vkontakte/android/auth/VKAuthState$1;
.super Ljava/lang/Object;
.source "VKAuthState.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/VKAuthState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/vkontakte/android/auth/VKAuthState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 163
    .local v2, "size":I
    new-instance v0, Lcom/vkontakte/android/auth/VKAuthState;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/vkontakte/android/auth/VKAuthState;-><init>(Lcom/vkontakte/android/auth/VKAuthState$1;)V

    .line 164
    .local v0, "VKAuthState":Lcom/vkontakte/android/auth/VKAuthState;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 165
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuthState;->access$100(Lcom/vkontakte/android/auth/VKAuthState;)Ljava/util/LinkedHashMap;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 167
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/vkontakte/android/auth/VKAuthState;->accessToken:Ljava/lang/String;

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/vkontakte/android/auth/VKAuthState;->secret:Ljava/lang/String;

    .line 169
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, v0, Lcom/vkontakte/android/auth/VKAuthState;->userId:I

    .line 170
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 160
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/auth/VKAuthState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/auth/VKAuthState;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 174
    new-array v0, p1, [Lcom/vkontakte/android/auth/VKAuthState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 160
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/auth/VKAuthState$1;->newArray(I)[Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    return-object v0
.end method
