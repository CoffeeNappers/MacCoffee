.class public Lcom/vkontakte/android/utils/RangesList$Entry;
.super Ljava/lang/Object;
.source "RangesList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/RangesList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field private from:J

.field private next:Lcom/vkontakte/android/utils/RangesList$Entry;

.field private prev:Lcom/vkontakte/android/utils/RangesList$Entry;

.field private to:J


# direct methods
.method private constructor <init>(JJ)V
    .locals 1
    .param p1, "from"    # J
    .param p3, "to"    # J

    .prologue
    const/4 v0, 0x0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->prev:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 88
    iput-object v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->next:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 94
    iput-wide p1, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    .line 95
    iput-wide p3, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    .line 96
    return-void
.end method

.method synthetic constructor <init>(JJLcom/vkontakte/android/utils/RangesList$1;)V
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # J
    .param p5, "x2"    # Lcom/vkontakte/android/utils/RangesList$1;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/utils/RangesList$Entry;-><init>(JJ)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 86
    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    return-wide v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/utils/RangesList$Entry;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 86
    iput-wide p1, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    return-wide p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 86
    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/utils/RangesList$Entry;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 86
    iput-wide p1, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;
    .param p1, "x1"    # Lcom/vkontakte/android/utils/RangesList;
    .param p2, "x2"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/utils/RangesList$Entry;->insertPrev(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList$Entry;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;
    .param p1, "x1"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/vkontakte/android/utils/RangesList$Entry;->linkNext(Lcom/vkontakte/android/utils/RangesList$Entry;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/utils/RangesList$Entry;)Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->next:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-object v0
.end method

.method private insertPrev(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V
    .locals 1
    .param p1, "list"    # Lcom/vkontakte/android/utils/RangesList;
    .param p2, "prev"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->prev:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 125
    .local v0, "lastPrev":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/utils/RangesList$Entry;->linkPrev(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    .line 126
    if-eqz p2, :cond_0

    .line 127
    invoke-direct {p2, p1, v0}, Lcom/vkontakte/android/utils/RangesList$Entry;->linkPrev(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    .line 129
    :cond_0
    return-void
.end method

.method private linkNext(Lcom/vkontakte/android/utils/RangesList$Entry;)V
    .locals 0
    .param p1, "next"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->next:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 108
    if-eqz p1, :cond_0

    .line 109
    iput-object p0, p1, Lcom/vkontakte/android/utils/RangesList$Entry;->prev:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 111
    :cond_0
    return-void
.end method

.method private linkPrev(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V
    .locals 1
    .param p1, "list"    # Lcom/vkontakte/android/utils/RangesList;
    .param p2, "prev"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 114
    invoke-static {p1}, Lcom/vkontakte/android/utils/RangesList;->access$600(Lcom/vkontakte/android/utils/RangesList;)Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v0

    if-ne p0, v0, :cond_0

    if-eqz p2, :cond_0

    .line 115
    invoke-static {p1, p2}, Lcom/vkontakte/android/utils/RangesList;->access$602(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 117
    :cond_0
    iput-object p2, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->prev:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 118
    if-eqz p2, :cond_1

    .line 119
    iput-object p0, p2, Lcom/vkontakte/android/utils/RangesList$Entry;->next:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 121
    :cond_1
    return-void
.end method


# virtual methods
.method public contains(J)Z
    .locals 3
    .param p1, "position"    # J

    .prologue
    .line 99
    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public from()J
    .locals 2

    .prologue
    .line 132
    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    return-wide v0
.end method

.method public next()Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->next:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-object v0
.end method

.method public to()J
    .locals 2

    .prologue
    .line 136
    iget-wide v0, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->from:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/utils/RangesList$Entry;->to:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
