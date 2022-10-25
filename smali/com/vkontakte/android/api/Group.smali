.class public Lcom/vkontakte/android/api/Group;
.super Lcom/vkontakte/android/api/models/Model;
.source "Group.java"

# interfaces
.implements Lcom/vkontakte/android/Indexable;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/Group$Deactivation;,
        Lcom/vkontakte/android/api/Group$Type;,
        Lcom/vkontakte/android/api/Group$Privacy;,
        Lcom/vkontakte/android/api/Group$Authority;
    }
.end annotation


# static fields
.field public static final ADMIN_LEVEL_ADMIN:I = 0x3

.field public static final ADMIN_LEVEL_EDITOR:I = 0x2

.field public static final ADMIN_LEVEL_MODERATOR:I = 0x1

.field public static final ADMIN_LEVEL_NONE:I = 0x0

.field public static final CLOSED_GROUP:I = 0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEACTIVATION_BANNED:Ljava/lang/String; = "banned"

.field public static final DEACTIVATION_DELETED:Ljava/lang/String; = "deleted"

.field public static final OPEN_GROUP:I = 0x0

.field public static final PRIVATE_GROUP:I = 0x2

.field public static final TYPE_EVENT:I = 0x1

.field public static final TYPE_GROUP:I = 0x0

.field public static final TYPE_PUBLIC:I = 0x2


# instance fields
.field public activity:Ljava/lang/String;

.field public adminLevel:I

.field public canMessage:Z

.field public deactivation:Ljava/lang/String;

.field public domain:Ljava/lang/String;

.field public id:I

.field public isAdmin:Z

.field public isClosed:I

.field public members_count:I

.field public messagesBlocked:Z

.field public name:Ljava/lang/String;

.field public photo:Ljava/lang/String;

.field public startTime:I

.field public stringMembersCount:Ljava/lang/String;

.field public type:I

.field public verified:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 191
    new-instance v0, Lcom/vkontakte/android/api/Group$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/Group$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/Group;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 147
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 148
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->id:I

    .line 149
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    .line 150
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    .line 151
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->domain:Ljava/lang/String;

    .line 152
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->isClosed:I

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->type:I

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/api/Group;->canMessage:Z

    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Group;->members_count:I

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vkontakte/android/api/Group;->verified:Z

    .line 161
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->activity:Ljava/lang/String;

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Group;->stringMembersCount:Ljava/lang/String;

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    :goto_3
    iput-boolean v1, p0, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    .line 164
    return-void

    :cond_0
    move v0, v2

    .line 152
    goto :goto_0

    :cond_1
    move v0, v2

    .line 158
    goto :goto_1

    :cond_2
    move v0, v2

    .line 160
    goto :goto_2

    :cond_3
    move v1, v2

    .line 163
    goto :goto_3
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "gr"    # Lorg/json/JSONObject;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 83
    :try_start_0
    const-string/jumbo v3, "id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->id:I

    .line 84
    const-string/jumbo v3, "name"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    .line 85
    const-string/jumbo v3, "screen_name"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/Group;->domain:Ljava/lang/String;

    .line 86
    const-string/jumbo v3, "activity"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/Group;->activity:Ljava/lang/String;

    .line 87
    const-string/jumbo v3, "is_admin"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_3

    move v3, v1

    :goto_0
    iput-boolean v3, p0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    .line 89
    const-string/jumbo v3, "admin_level"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    .line 90
    const-string/jumbo v3, "is_closed"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->isClosed:I

    .line 92
    const-string/jumbo v3, "deactivated"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    .line 93
    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v4, 0x40000000    # 2.0f

    cmpl-float v3, v3, v4

    if-gez v3, :cond_0

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_0
    const-string/jumbo v3, "photo_200"

    :goto_1
    const-string/jumbo v4, "photo_100"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    .line 94
    const/4 v3, 0x0

    iput v3, p0, Lcom/vkontakte/android/api/Group;->type:I

    .line 95
    const-string/jumbo v3, "start_date"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    .line 97
    const-string/jumbo v3, "admin_level"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    .line 98
    const-string/jumbo v3, "can_message"

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_6

    move v3, v1

    :goto_2
    iput-boolean v3, p0, Lcom/vkontakte/android/api/Group;->canMessage:Z

    .line 99
    const-string/jumbo v3, "is_messages_blocked"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_7

    move v3, v1

    :goto_3
    iput-boolean v3, p0, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    .line 100
    const-string/jumbo v3, "event"

    const-string/jumbo v4, "type"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 101
    const/4 v3, 0x1

    iput v3, p0, Lcom/vkontakte/android/api/Group;->type:I

    .line 103
    :cond_1
    const-string/jumbo v3, "page"

    const-string/jumbo v4, "type"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 104
    const/4 v3, 0x2

    iput v3, p0, Lcom/vkontakte/android/api/Group;->type:I

    .line 106
    :cond_2
    const-string/jumbo v3, "members_count"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/Group;->members_count:I

    .line 107
    const-string/jumbo v3, "verified"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_8

    :goto_4
    iput-boolean v1, p0, Lcom/vkontakte/android/api/Group;->verified:Z

    .line 111
    :goto_5
    return-void

    :cond_3
    move v3, v2

    .line 87
    goto/16 :goto_0

    .line 93
    :cond_4
    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5

    const-string/jumbo v3, "photo_100"

    goto/16 :goto_1

    :cond_5
    const-string/jumbo v3, "photo_50"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    :cond_6
    move v3, v2

    .line 98
    goto :goto_2

    :cond_7
    move v3, v2

    .line 99
    goto :goto_3

    :cond_8
    move v1, v2

    .line 107
    goto :goto_4

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error parsing group"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 203
    if-ne p0, p1, :cond_1

    .line 212
    :cond_0
    :goto_0
    return v1

    .line 206
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 207
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 210
    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 212
    .local v0, "group":Lcom/vkontakte/android/api/Group;
    iget v3, p0, Lcom/vkontakte/android/api/Group;->id:I

    iget v4, v0, Lcom/vkontakte/android/api/Group;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getIndexChars()[C
    .locals 9

    .prologue
    .line 120
    iget-object v7, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 121
    .local v6, "words":[Ljava/lang/String;
    array-length v7, v6

    new-array v4, v7, [C

    .line 122
    .local v4, "result":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v7, v6

    if-ge v0, v7, :cond_3

    .line 123
    aget-object v5, v6, v0

    .line 124
    .local v5, "word":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    .line 125
    .local v2, "length":I
    if-nez v2, :cond_1

    .line 122
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 128
    :cond_1
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-ge v1, v2, :cond_0

    .line 129
    invoke-virtual {v5, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 130
    .local v3, "letter":C
    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 131
    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v7

    aput-char v7, v4, v0

    goto :goto_1

    .line 128
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 136
    .end local v1    # "j":I
    .end local v2    # "length":I
    .end local v3    # "letter":C
    .end local v5    # "word":Ljava/lang/String;
    :cond_3
    return-object v4
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lcom/vkontakte/android/api/Group;->id:I

    return v0
.end method

.method public matches(Ljava/lang/String;)Z
    .locals 1
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 168
    iget v0, p0, Lcom/vkontakte/android/api/Group;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 171
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->domain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 172
    iget-boolean v0, p0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 173
    iget v0, p0, Lcom/vkontakte/android/api/Group;->isClosed:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 175
    iget v0, p0, Lcom/vkontakte/android/api/Group;->type:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 176
    iget v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 177
    iget v0, p0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 178
    iget-boolean v0, p0, Lcom/vkontakte/android/api/Group;->canMessage:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 179
    iget v0, p0, Lcom/vkontakte/android/api/Group;->members_count:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 180
    iget-boolean v0, p0, Lcom/vkontakte/android/api/Group;->verified:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->activity:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/api/Group;->stringMembersCount:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 183
    iget-boolean v0, p0, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    if-eqz v0, :cond_3

    :goto_3
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 184
    return-void

    :cond_0
    move v0, v2

    .line 172
    goto :goto_0

    :cond_1
    move v0, v2

    .line 178
    goto :goto_1

    :cond_2
    move v0, v2

    .line 180
    goto :goto_2

    :cond_3
    move v1, v2

    .line 183
    goto :goto_3
.end method
