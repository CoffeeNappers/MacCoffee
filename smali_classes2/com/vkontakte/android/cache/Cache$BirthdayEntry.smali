.class public Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
.super Lcom/vkontakte/android/UserProfile;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/cache/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BirthdayEntry"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/cache/Cache$BirthdayEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public bDay:I

.field public bMonth:I

.field public bYear:I

.field public date:Ljava/lang/String;

.field public isToday:Z

.field public subtitle:Ljava/lang/String;

.field public upcoming:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1246
    new-instance v0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry$1;

    invoke-direct {v0}, Lcom/vkontakte/android/cache/Cache$BirthdayEntry$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1233
    invoke-direct {p0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 1234
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 1237
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 1238
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    .line 1239
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    .line 1240
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    .line 1241
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    .line 1242
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    .line 1243
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    .line 1244
    return-void
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 1223
    invoke-super {p0, p1}, Lcom/vkontakte/android/UserProfile;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 1224
    iget v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1225
    iget v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1226
    iget v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1227
    iget-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1228
    iget-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1229
    iget-object v0, p0, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1230
    return-void
.end method
