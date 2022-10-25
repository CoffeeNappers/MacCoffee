.class public Lcom/vkontakte/android/attachments/ShitAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "ShitAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/statistics/Statistic;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment;",
            ">;"
        }
    .end annotation
.end field

.field public static final TARGET_EXTERNAL:I = 0x0

.field public static final TARGET_INTERNAL:I = 0x1

.field public static final TARGET_INTERNAL_VISIBLE:I = 0x2


# instance fields
.field public ageRestriction:Ljava/lang/String;

.field public appPackage:Ljava/lang/String;

.field public buttonText:Ljava/lang/String;

.field public buttonTextInstalled:Ljava/lang/String;

.field public cards:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
            ">;"
        }
    .end annotation
.end field

.field public data:Ljava/lang/String;

.field public dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

.field public deepLink:Ljava/lang/String;

.field public followers:Ljava/lang/String;

.field public genre:Ljava/lang/String;

.field public guid:Ljava/lang/String;

.field public transient installed:Z

.field public link:Ljava/lang/String;

.field public linkTarget:I

.field public photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

.field public rating:F

.field public final statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

.field public text:Ljava/lang/String;

.field public timeToLive:I

.field public userName:Ljava/lang/String;

.field public userPhoto:Ljava/lang/String;

.field public video:Lcom/vkontakte/android/attachments/VideoAttachment;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 150
    new-instance v0, Lcom/vkontakte/android/attachments/ShitAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/ShitAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/ShitAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 39
    new-instance v0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-direct {v0}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/statistics/StatisticUrl;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "_guid"    # Ljava/lang/String;
    .param p2, "_followers"    # Ljava/lang/String;
    .param p3, "_btnText"    # Ljava/lang/String;
    .param p4, "_link"    # Ljava/lang/String;
    .param p5, "_rating"    # F
    .param p6, "_buttonTextInstalled"    # Ljava/lang/String;
    .param p7, "_data"    # Ljava/lang/String;
    .param p8, "_dataImpression"    # Lcom/vkontakte/android/statistics/StatisticUrl;
    .param p9, "_appPackage"    # Ljava/lang/String;
    .param p10, "_deepLink"    # Ljava/lang/String;
    .param p11, "_linkTarget"    # I
    .param p12, "_text"    # Ljava/lang/String;
    .param p13, "_genre"    # Ljava/lang/String;
    .param p14, "_timeToLive"    # I
    .param p15, "_userName"    # Ljava/lang/String;
    .param p16, "_userPhoto"    # Ljava/lang/String;
    .param p17, "_ageRestriction"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 39
    new-instance v1, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-direct {v1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    .line 40
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    .line 49
    iput-object p1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->guid:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->followers:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonText:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->link:Ljava/lang/String;

    .line 53
    iput p5, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->rating:F

    .line 54
    iput-object p6, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonTextInstalled:Ljava/lang/String;

    .line 55
    iput-object p7, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    .line 56
    iput-object p8, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 57
    iput-object p9, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    .line 58
    iput-object p10, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->deepLink:Ljava/lang/String;

    .line 59
    iput p11, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->linkTarget:I

    .line 60
    iput-object p12, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    .line 61
    iput-object p13, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->genre:Ljava/lang/String;

    .line 62
    move/from16 v0, p14

    iput v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    .line 63
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->userName:Ljava/lang/String;

    .line 64
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    .line 65
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/ShitAttachment;->updateInstallationState()V

    .line 67
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-static {p0}, Lcom/vkontakte/android/attachments/ShitAttachment;->isAppInstalled(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isAppInstalled(Ljava/lang/String;)Z
    .locals 4
    .param p0, "appPackage"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 107
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 114
    :cond_0
    :goto_0
    return v1

    .line 111
    :cond_1
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    const/4 v1, 0x1

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "x":Ljava/lang/Exception;
    goto :goto_0
.end method


# virtual methods
.method public addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    .locals 1
    .param p1, "url"    # Lcom/vkontakte/android/statistics/StatisticUrl;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 72
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
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
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getStatisticHash()I
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public getStatisticSizeByType(Ljava/lang/String;)I
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->getStatisticSizeByType(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "os"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 121
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->guid:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 122
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->followers:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 123
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->link:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 125
    iget v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->rating:F

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeFloat(F)V

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonTextInstalled:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 127
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 129
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->deepLink:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 131
    iget v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->linkTarget:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 132
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 133
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->genre:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 134
    iget v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 135
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->userName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 136
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 137
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 139
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 141
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 142
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .line 143
    .local v0, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    goto :goto_0

    .line 146
    .end local v0    # "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 147
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 148
    return-void
.end method

.method public updateInstallationState()V
    .locals 3

    .prologue
    .line 100
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/ShitAttachment;->isAppInstalled(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    .line 101
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .line 102
    .local v0, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->updateInstallationState()V

    goto :goto_0

    .line 104
    .end local v0    # "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    :cond_0
    return-void
.end method
