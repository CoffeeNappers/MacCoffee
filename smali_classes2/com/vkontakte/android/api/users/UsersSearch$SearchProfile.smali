.class public Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;
.super Lcom/vkontakte/android/UserProfile;
.source "UsersSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/users/UsersSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SearchProfile"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public commonCount:I

.field public commonCountStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 166
    new-instance v0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 142
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 162
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    .line 163
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCountStr:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 145
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 146
    const-string/jumbo v0, "common_count"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    .line 147
    const-string/jumbo v0, "verified"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->verified:Z

    .line 148
    iget v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    if-lez v0, :cond_0

    .line 149
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0d0040

    iget v4, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    new-array v1, v1, [Ljava/lang/Object;

    iget v5, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-virtual {v0, v3, v4, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCountStr:Ljava/lang/String;

    .line 151
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 147
    goto :goto_0
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "dest"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 155
    invoke-super {p0, p1}, Lcom/vkontakte/android/UserProfile;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 156
    iget v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->commonCountStr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 158
    return-void
.end method
