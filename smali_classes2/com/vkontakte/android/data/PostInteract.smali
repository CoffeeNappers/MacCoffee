.class public Lcom/vkontakte/android/data/PostInteract;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PostInteract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/PostInteract$Type;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/data/PostInteract;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public adData:Ljava/lang/String;

.field private adsClickUrls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;"
        }
    .end annotation
.end field

.field private cardData:Ljava/lang/String;

.field private link:Ljava/lang/String;

.field private final postIdStr:Ljava/lang/String;

.field public final refer:Ljava/lang/String;

.field private trackCode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    new-instance v0, Lcom/vkontakte/android/data/PostInteract$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PostInteract$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/PostInteract;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 110
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 111
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    .line 112
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    .line 113
    sget-object v0, Lcom/vkontakte/android/statistics/StatisticUrl;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    .line 114
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V
    .locals 1
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 35
    invoke-virtual {p2}, Lcom/vkontakte/android/NewsEntry;->getShitAttachment()Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 2
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "shitAttachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    .line 41
    invoke-virtual {p2}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->trackCode:Ljava/lang/String;

    .line 42
    if-eqz p3, :cond_0

    .line 43
    iget-object v0, p3, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    .line 44
    const-string/jumbo v0, "click_post_link"

    invoke-virtual {p3, v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    .line 46
    :cond_0
    return-void
.end method

.method private send(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "type"    # Lcom/vkontakte/android/data/PostInteract$Type;
    .param p2, "link"    # Ljava/lang/String;
    .param p3, "immediately"    # Z

    .prologue
    .line 63
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 64
    iget-object v1, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 65
    const-string/jumbo v1, "post_interaction"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "post_id"

    iget-object v3, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    .line 66
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "action"

    .line 67
    invoke-virtual {p1}, Lcom/vkontakte/android/data/PostInteract$Type;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "ref"

    iget-object v3, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    .line 68
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 69
    .local v0, "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    iget-object v1, p0, Lcom/vkontakte/android/data/PostInteract;->trackCode:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    const-string/jumbo v1, "track_code"

    iget-object v2, p0, Lcom/vkontakte/android/data/PostInteract;->trackCode:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 72
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 73
    const-string/jumbo v1, "link"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 75
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 76
    const-string/jumbo v1, "ad_data"

    iget-object v2, p0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 78
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/data/PostInteract;->cardData:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 79
    const-string/jumbo v1, "card_data"

    iget-object v2, p0, Lcom/vkontakte/android/data/PostInteract;->cardData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 82
    :cond_3
    if-eqz p3, :cond_5

    .line 83
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 88
    .end local v0    # "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :cond_4
    :goto_0
    return-void

    .line 85
    .restart local v0    # "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :cond_5
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto :goto_0
.end method


# virtual methods
.method public commit(Lcom/vkontakte/android/data/PostInteract$Type;)V
    .locals 2
    .param p1, "type"    # Lcom/vkontakte/android/data/PostInteract$Type;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->link:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/data/PostInteract;->send(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;Z)V

    .line 92
    sget-object v0, Lcom/vkontakte/android/data/PostInteract$Type;->link_click:Lcom/vkontakte/android/data/PostInteract$Type;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->sendPromoAction(Ljava/util/List;)V

    .line 95
    :cond_0
    return-void
.end method

.method public getPostIdStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    return-object v0
.end method

.method public sendNow(Lcom/vkontakte/android/data/PostInteract$Type;)V
    .locals 1
    .param p1, "type"    # Lcom/vkontakte/android/data/PostInteract$Type;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->link:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method public sendNow(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Lcom/vkontakte/android/data/PostInteract$Type;
    .param p2, "link"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/data/PostInteract;->send(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;Z)V

    .line 99
    sget-object v0, Lcom/vkontakte/android/data/PostInteract$Type;->link_click:Lcom/vkontakte/android/data/PostInteract$Type;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->sendPromoAction(Ljava/util/List;)V

    .line 102
    :cond_0
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->postIdStr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public setCardData(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;
    .locals 0
    .param p1, "cardData"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/data/PostInteract;->cardData:Ljava/lang/String;

    .line 55
    return-object p0
.end method

.method public setClickPostLinks(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "adsClickUrls":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    iput-object p1, p0, Lcom/vkontakte/android/data/PostInteract;->adsClickUrls:Ljava/util/List;

    .line 60
    return-void
.end method

.method public setLink(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;
    .locals 0
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vkontakte/android/data/PostInteract;->link:Ljava/lang/String;

    .line 50
    return-object p0
.end method
