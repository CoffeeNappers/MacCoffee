.class public Lcom/vkontakte/android/UserProfile;
.super Lcom/vkontakte/android/api/models/Model;
.source "UserProfile.java"

# interfaces
.implements Lcom/vkontakte/android/utils/Serializer$Serializable;
.implements Lcom/vkontakte/android/Indexable;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY_USER:Lcom/vkontakte/android/UserProfile;

.field public static final ID_REGEX:Ljava/lang/String; = "(id|club)[0-9]+"

.field public static final OFFLINE:I = 0x0

.field public static final ONLINE_MOBILE_APP:I = 0x3

.field public static final ONLINE_MOBILE_SITE:I = 0x2

.field public static final ONLINE_SITE:I = 0x1


# instance fields
.field public bdate:Ljava/lang/String;

.field public city:I

.field public country:I

.field public domain:Ljava/lang/String;

.field public extra:Landroid/os/Bundle;

.field public f:Z

.field public firstName:Ljava/lang/String;

.field public fullName:Ljava/lang/String;

.field public isFriend:Z

.field public isSelected:Z

.field public lastName:Ljava/lang/String;

.field public online:I

.field public photo:Ljava/lang/String;

.field public uid:I

.field public university:Ljava/lang/String;

.field public verified:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    sput-object v0, Lcom/vkontakte/android/UserProfile;->EMPTY_USER:Lcom/vkontakte/android/UserProfile;

    .line 214
    new-instance v0, Lcom/vkontakte/android/UserProfile$1;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "http://vkontakte.ru/images/question_c.gif"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 47
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/UserProfile;)V
    .locals 1
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "http://vkontakte.ru/images/question_c.gif"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 59
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 60
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 61
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 62
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 63
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 64
    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 65
    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 66
    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 67
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->online:I

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 68
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->city:I

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->city:I

    .line 69
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->country:I

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->country:I

    .line 70
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 71
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 72
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 73
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 74
    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->verified:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->verified:Z

    .line 75
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Group;)V
    .locals 1
    .param p1, "g"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "http://vkontakte.ru/images/question_c.gif"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 171
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 172
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 173
    iget v0, p1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 174
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->domain:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 175
    iget-boolean v0, p1, Lcom/vkontakte/android/api/Group;->verified:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->verified:Z

    .line 176
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 7
    .param p1, "vkAccount"    # Lcom/vkontakte/android/auth/VKAccount;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 90
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v2, "http://vkontakte.ru/images/question_c.gif"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    iput v5, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    iput-object v3, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 92
    invoke-virtual {p1}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 94
    const-string/jumbo v2, " "

    const/4 v4, 0x2

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "sp":[Ljava/lang/String;
    array-length v2, v1

    if-lez v2, :cond_2

    aget-object v2, v1, v5

    :goto_0
    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 96
    array-length v2, v1

    if-le v2, v6, :cond_0

    aget-object v3, v1, v6

    :cond_0
    iput-object v3, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 98
    .end local v1    # "sp":[Ljava/lang/String;
    :cond_1
    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 99
    invoke-virtual {p1}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 100
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 101
    return-void

    .restart local v1    # "sp":[Ljava/lang/String;
    :cond_2
    move-object v2, v3

    .line 95
    goto :goto_0
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "http://vkontakte.ru/images/question_c.gif"

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    iput v2, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 79
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 80
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 81
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 82
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 84
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 85
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 86
    const-class v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 87
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/vkontakte/android/UserProfile;->verified:Z

    .line 88
    return-void

    :cond_0
    move v0, v2

    .line 84
    goto :goto_0

    :cond_1
    move v0, v2

    .line 85
    goto :goto_1

    :cond_2
    move v1, v2

    .line 87
    goto :goto_2
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 103
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 31
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 32
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 33
    const-string/jumbo v2, "DELETED"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 34
    const-string/jumbo v2, "http://vkontakte.ru/images/question_c.gif"

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 38
    iput v4, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 40
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 41
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 104
    const-string/jumbo v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 105
    const-string/jumbo v2, "first_name"

    iget-object v5, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {p1, v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 106
    const-string/jumbo v2, "last_name"

    iget-object v5, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {p1, v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 107
    const-string/jumbo v2, "domain"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v5, " "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 109
    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v5, 0x40000000    # 2.0f

    cmpl-float v2, v2, v5

    if-gez v2, :cond_0

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_0
    const-string/jumbo v2, "photo_200"

    :goto_0
    const-string/jumbo v5, "photo_100"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 110
    const-string/jumbo v2, "sex"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_d

    move v2, v3

    :goto_1
    iput-boolean v2, p0, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 111
    invoke-static {p1}, Lcom/vkontakte/android/Global;->getUserOnlineStatus(Lorg/json/JSONObject;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 112
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 113
    const-string/jumbo v2, "first_name_gen"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "first_name_gen"

    const-string/jumbo v6, "first_name_gen"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    const-string/jumbo v2, "last_name_gen"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "name_gen"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "first_name_gen"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "last_name_gen"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    :cond_1
    const-string/jumbo v2, "first_name_dat"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 120
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "first_name_dat"

    const-string/jumbo v6, "first_name_dat"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string/jumbo v2, "last_name_dat"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 122
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "name_dat"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "first_name_dat"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "last_name_dat"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :cond_2
    const-string/jumbo v2, "first_name_acc"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "last_name_acc"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 126
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "first_name_acc"

    const-string/jumbo v6, "first_name_acc"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string/jumbo v2, "last_name_acc"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 128
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "name_acc"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "first_name_acc"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "last_name_acc"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_3
    const-string/jumbo v2, "first_name_ins"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "last_name_ins"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 132
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "first_name_ins"

    const-string/jumbo v6, "first_name_ins"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string/jumbo v2, "last_name_ins"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 134
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "name_ins"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "first_name_ins"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "last_name_ins"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    :cond_4
    const-string/jumbo v2, "first_name_abl"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string/jumbo v2, "last_name_abl"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 138
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "first_name_abl"

    const-string/jumbo v6, "first_name_abl"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    const-string/jumbo v2, "last_name_abl"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 140
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "name_abl"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "first_name_abl"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "last_name_abl"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :cond_5
    const-string/jumbo v2, "university_name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    const-string/jumbo v2, "university_name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_e

    .line 144
    const-string/jumbo v2, "university_name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 145
    const-string/jumbo v2, "graduation"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 146
    const-string/jumbo v2, "graduation"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 147
    .local v1, "g":I
    if-lez v1, :cond_6

    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v5, " \'%02d"

    new-array v6, v3, [Ljava/lang/Object;

    rem-int/lit8 v7, v1, 0x64

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 155
    .end local v1    # "g":I
    :cond_6
    :goto_2
    const-string/jumbo v2, "verified"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string/jumbo v2, "verified"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_7

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "verified"

    invoke-virtual {v2, v5, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 157
    iput-boolean v3, p0, Lcom/vkontakte/android/UserProfile;->verified:Z

    .line 159
    :cond_7
    const-string/jumbo v2, "is_friend"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 160
    const-string/jumbo v2, "is_friend"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_f

    move v2, v3

    :goto_3
    iput-boolean v2, p0, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 162
    :cond_8
    const-string/jumbo v2, "description"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 163
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "description"

    const-string/jumbo v6, "description"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    :cond_9
    const-string/jumbo v2, "is_messages_blocked"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 166
    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "is_messages_blocked"

    const-string/jumbo v6, "is_messages_blocked"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    if-ne v6, v3, :cond_10

    :goto_4
    invoke-virtual {v2, v5, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 168
    :cond_a
    return-void

    .line 109
    :cond_b
    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v5

    if-lez v2, :cond_c

    const-string/jumbo v2, "photo_100"

    goto/16 :goto_0

    :cond_c
    const-string/jumbo v2, "photo_50"

    goto/16 :goto_0

    :cond_d
    move v2, v4

    .line 110
    goto/16 :goto_1

    .line 151
    :cond_e
    const-string/jumbo v2, "city"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 152
    const-string/jumbo v2, "city"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 153
    .local v0, "city":Lorg/json/JSONObject;
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto/16 :goto_2

    .end local v0    # "city":Lorg/json/JSONObject;
    :cond_f
    move v2, v4

    .line 160
    goto :goto_3

    :cond_10
    move v3, v4

    .line 166
    goto :goto_4
.end method

.method private static getFirstChar(Ljava/lang/String;)C
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 274
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/16 v0, 0x20

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    goto :goto_0
.end method

.method private static getFirstChars(Ljava/lang/String;)[C
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 278
    if-nez p0, :cond_1

    .line 279
    const/4 v3, 0x1

    new-array v0, v3, [C

    const/4 v3, 0x0

    const/16 v4, 0x20

    aput-char v4, v0, v3

    .line 286
    :cond_0
    return-object v0

    .line 281
    :cond_1
    const-string/jumbo v3, " "

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 282
    .local v2, "strings":[Ljava/lang/String;
    array-length v3, v2

    new-array v0, v3, [C

    .line 283
    .local v0, "chars":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 284
    aget-object v3, v2, v1

    invoke-static {v3}, Lcom/vkontakte/android/UserProfile;->getFirstChar(Ljava/lang/String;)C

    move-result v3

    aput-char v3, v0, v1

    .line 283
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static isWordStartFrom(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 291
    if-eqz p0, :cond_0

    .line 292
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 293
    .local v1, "strings":[Ljava/lang/String;
    array-length v4, v1

    move v3, v2

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 294
    .local v0, "s1":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 295
    const/4 v2, 0x1

    .line 299
    .end local v0    # "s1":Ljava/lang/String;
    .end local v1    # "strings":[Ljava/lang/String;
    :cond_0
    return v2

    .line 293
    .restart local v0    # "s1":Ljava/lang/String;
    .restart local v1    # "strings":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 227
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 266
    instance-of v2, p1, Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 267
    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 268
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget v2, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 270
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    return v1
.end method

.method public getHasRealDomain()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 51
    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 54
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    const-string/jumbo v2, "(id|club)[0-9]+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getIndexChars()[C
    .locals 3

    .prologue
    .line 304
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v1, 0x77359400

    if-le v0, v1, :cond_0

    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/UserProfile;->getFirstChars(Ljava/lang/String;)[C

    move-result-object v0

    .line 307
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [C

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/UserProfile;->getFirstChar(Ljava/lang/String;)C

    move-result v2

    aput-char v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/UserProfile;->getFirstChar(Ljava/lang/String;)C

    move-result v2

    aput-char v2, v0, v1

    goto :goto_0
.end method

.method public getIsGroup()Z
    .locals 1

    .prologue
    .line 254
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNameInCase(I)Ljava/lang/String;
    .locals 2
    .param p1, "c"    # I

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/UserProfile;->getIsGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 211
    :goto_0
    return-object v0

    .line 184
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 211
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 186
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_0

    .line 188
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "name_gen"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 190
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "name_dat"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 192
    :pswitch_4
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "name_acc"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 194
    :pswitch_5
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "name_ins"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 196
    :pswitch_6
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "name_abl"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 199
    :pswitch_7
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    goto :goto_0

    .line 201
    :pswitch_8
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "first_name_gen"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 203
    :pswitch_9
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "first_name_dat"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 205
    :pswitch_a
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "first_name_acc"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 207
    :pswitch_b
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "first_name_ins"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 209
    :pswitch_c
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "first_name_abl"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 184
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 262
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    return v0
.end method

.method public matches(Ljava/lang/String;)Z
    .locals 2
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 313
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v1, 0x77359400

    if-le v0, v1, :cond_0

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/vkontakte/android/UserProfile;->isWordStartFrom(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 316
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 241
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 246
    iget v0, p0, Lcom/vkontakte/android/UserProfile;->online:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 247
    iget-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 248
    iget-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeBundle(Landroid/os/Bundle;)V

    .line 250
    iget-boolean v0, p0, Lcom/vkontakte/android/UserProfile;->verified:Z

    if-eqz v0, :cond_2

    :goto_2
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 251
    return-void

    :cond_0
    move v0, v2

    .line 247
    goto :goto_0

    :cond_1
    move v0, v2

    .line 248
    goto :goto_1

    :cond_2
    move v1, v2

    .line 250
    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "User {id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "], photo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", online="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/UserProfile;->online:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", extra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", gender="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/UserProfile;->f:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "arg1"    # I

    .prologue
    .line 233
    :try_start_0
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->get(Landroid/os/Parcel;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/UserProfile;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    :goto_0
    return-void

    .line 234
    :catch_0
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
