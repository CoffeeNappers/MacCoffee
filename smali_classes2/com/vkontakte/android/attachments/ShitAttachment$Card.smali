.class public Lcom/vkontakte/android/attachments/ShitAttachment$Card;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "ShitAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/statistics/Statistic;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/ShitAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Card"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public appPackage:Ljava/lang/String;

.field public buttonText:Ljava/lang/String;

.field public buttonTextInstalled:Ljava/lang/String;

.field public deepLink:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public followers:Ljava/lang/String;

.field public transient installed:Z

.field public link:Ljava/lang/String;

.field public linkTarget:I

.field public photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

.field public rating:F

.field public final statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 235
    new-instance v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/ShitAttachment$Card$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 189
    new-instance v0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-direct {v0}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    .line 192
    return-void
.end method


# virtual methods
.method public addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    .locals 1
    .param p1, "url"    # Lcom/vkontakte/android/statistics/StatisticUrl;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 197
    return-void
.end method

.method public getStatisticByType(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getStatisticHash()I
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcThumb:Ljava/lang/String;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcThumb:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public getStatisticSizeByType(Ljava/lang/String;)I
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->getStatisticSizeByType(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "os"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->link:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->deepLink:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->appPackage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->followers:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonTextInstalled:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 224
    iget v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->rating:F

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeFloat(F)V

    .line 225
    iget v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->linkTarget:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 229
    return-void
.end method

.method public updateInstallationState()V
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->appPackage:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->access$000(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->installed:Z

    .line 233
    return-void
.end method
