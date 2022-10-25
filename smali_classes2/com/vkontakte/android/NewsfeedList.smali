.class public Lcom/vkontakte/android/NewsfeedList;
.super Ljava/lang/Object;
.source "NewsfeedList.java"


# static fields
.field private static final promoCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private id:I

.field private promoId:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, -0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/NewsfeedList;->promoCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/vkontakte/android/NewsfeedList;->id:I

    .line 24
    iput-object p2, p0, Lcom/vkontakte/android/NewsfeedList;->title:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    sget-object v0, Lcom/vkontakte/android/NewsfeedList;->promoCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsfeedList;->id:I

    .line 29
    iput-object p1, p0, Lcom/vkontakte/android/NewsfeedList;->promoId:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/vkontakte/android/NewsfeedList;->title:Ljava/lang/String;

    .line 31
    return-void
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
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string/jumbo v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 36
    .local v0, "idObj":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 37
    check-cast v0, Ljava/lang/String;

    .end local v0    # "idObj":Ljava/lang/Object;
    iput-object v0, p0, Lcom/vkontakte/android/NewsfeedList;->promoId:Ljava/lang/String;

    .line 38
    sget-object v1, Lcom/vkontakte/android/NewsfeedList;->promoCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/NewsfeedList;->id:I

    .line 42
    :goto_0
    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/NewsfeedList;->title:Ljava/lang/String;

    .line 43
    return-void

    .line 40
    .restart local v0    # "idObj":Ljava/lang/Object;
    :cond_0
    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "idObj":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/NewsfeedList;->id:I

    goto :goto_0
.end method

.method public static resetCounter()V
    .locals 2

    .prologue
    .line 62
    sget-object v0, Lcom/vkontakte/android/NewsfeedList;->promoCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, -0xa

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 63
    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/vkontakte/android/NewsfeedList;->id:I

    return v0
.end method

.method public getPromoId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/NewsfeedList;->promoId:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/NewsfeedList;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isPromoList()Z
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/NewsfeedList;->promoId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
