.class public Lcom/vkontakte/android/attachments/PollAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "PollAttachment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public answers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment$Answer;",
            ">;"
        }
    .end annotation
.end field

.field public isAnonymous:Z

.field public isBoard:Z

.field public lastUpdated:I

.field public numVotes:I

.field public oid:I

.field public transient parentPost:Lcom/vkontakte/android/NewsEntry;

.field public pid:I

.field public question:Ljava/lang/String;

.field public userAnswer:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 395
    new-instance v0, Lcom/vkontakte/android/attachments/PollAttachment$8;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PollAttachment$8;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PollAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 6
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 380
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 48
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    .line 381
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    .line 382
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    .line 383
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    .line 384
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    .line 385
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 386
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    const-class v5, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 388
    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    .line 389
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    .line 390
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    :goto_1
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    .line 391
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    .line 392
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v2

    if-eqz v2, :cond_2

    :goto_2
    iput-boolean v3, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isBoard:Z

    .line 393
    return-void

    :cond_1
    move v2, v4

    .line 390
    goto :goto_1

    :cond_2
    move v3, v4

    .line 392
    goto :goto_2
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/util/ArrayList;IIZIZ)V
    .locals 1
    .param p1, "question"    # Ljava/lang/String;
    .param p2, "oid"    # I
    .param p3, "pid"    # I
    .param p5, "numVotes"    # I
    .param p6, "userAnswer"    # I
    .param p7, "isAnonymous"    # Z
    .param p8, "lastUpdated"    # I
    .param p9, "isBoard"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment$Answer;",
            ">;IIZIZ)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p4, "answers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PollAttachment$Answer;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    .line 77
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    .line 78
    iput p2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    .line 79
    iput p3, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    .line 80
    iput-object p4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    .line 81
    iput p5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    .line 82
    iput p6, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    .line 83
    iput-boolean p7, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    .line 84
    iput p8, p0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    .line 85
    iput-boolean p9, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isBoard:Z

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "att"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 56
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 48
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    .line 57
    const-string/jumbo v5, "answers"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 58
    .local v3, "ja":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 59
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 60
    .local v2, "j":Lorg/json/JSONObject;
    new-instance v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PollAttachment$Answer;-><init>()V

    .line 61
    .local v0, "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    const-string/jumbo v5, "id"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    .line 62
    const-string/jumbo v5, "text"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    .line 63
    const-string/jumbo v5, "votes"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    .line 64
    const-string/jumbo v5, "rate"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    double-to-float v5, v6

    iput v5, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    .line 65
    iget-object v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 67
    .end local v0    # "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    .end local v2    # "j":Lorg/json/JSONObject;
    :cond_0
    const-string/jumbo v5, "question"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    .line 68
    const-string/jumbo v5, "owner_id"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    .line 69
    const-string/jumbo v5, "id"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    .line 70
    const-string/jumbo v5, "votes"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    .line 71
    const-string/jumbo v5, "answer_id"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    .line 72
    const-string/jumbo v5, "anonymous"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v4, :cond_1

    :goto_1
    iput-boolean v4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v4, v4

    iput v4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    .line 74
    return-void

    .line 72
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/PollAttachment;Lcom/vkontakte/android/attachments/PollAttachment$Answer;Landroid/view/ViewGroup;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    .param p2, "x2"    # Landroid/view/ViewGroup;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/attachments/PollAttachment;->vote(Lcom/vkontakte/android/attachments/PollAttachment$Answer;Landroid/view/ViewGroup;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/ViewGroup;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p1, "x1"    # Landroid/view/ViewGroup;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment;->unvote(Landroid/view/ViewGroup;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment;->updateAttachViewText(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Z

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/attachments/PollAttachment;->updateAttachViewProgress(Landroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/PollAttachment;->updateCachedPost()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment;->bindView(Landroid/view/View;)V

    return-void
.end method

.method private bindView(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v10, 0x0

    .line 97
    const v7, 0x7f1001dc

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iget-object v8, p0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment;->updateAttachViewText(Landroid/view/View;)V

    .line 100
    const v7, 0x7f1001f4

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 101
    .local v6, "wrap":Landroid/view/ViewGroup;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v4, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    if-ge v3, v7, :cond_1

    .line 103
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    instance-of v7, v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    if-eqz v7, :cond_0

    .line 104
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 108
    .local v5, "vv":Landroid/view/View;
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_1

    .line 111
    .end local v5    # "vv":Landroid/view/View;
    :cond_2
    iget-object v7, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 112
    .local v0, "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string/jumbo v9, "layout_inflater"

    invoke-virtual {v7, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/LayoutInflater;

    const v9, 0x7f0301af

    invoke-virtual {v7, v9, v6, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 113
    .local v1, "av":Landroid/view/View;
    const v7, 0x7f1004be

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iget-object v9, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    new-instance v2, Lcom/vkontakte/android/ui/PollOptionBackgroundDrawable;

    invoke-direct {v2}, Lcom/vkontakte/android/ui/PollOptionBackgroundDrawable;-><init>()V

    .line 115
    .local v2, "bg":Lcom/vkontakte/android/ui/PollOptionBackgroundDrawable;
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 117
    invoke-direct {p0, v1, v10}, Lcom/vkontakte/android/attachments/PollAttachment;->updateAttachViewProgress(Landroid/view/View;Z)V

    .line 118
    new-instance v7, Lcom/vkontakte/android/attachments/PollAttachment$1;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/attachments/PollAttachment$1;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    new-instance v7, Lcom/vkontakte/android/attachments/PollAttachment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/attachments/PollAttachment$2;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 144
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 146
    .end local v0    # "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    .end local v1    # "av":Landroid/view/View;
    .end local v2    # "bg":Lcom/vkontakte/android/ui/PollOptionBackgroundDrawable;
    :cond_3
    return-void
.end method

.method private reloadIfNeeded(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    sub-int/2addr v0, v1

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_0

    .line 247
    :goto_0
    return-void

    .line 229
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsGetById;

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    iget v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/polls/PollsGetById;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/attachments/PollAttachment$5;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment$5;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 246
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private unvote(Landroid/view/ViewGroup;)V
    .locals 5
    .param p1, "wrap"    # Landroid/view/ViewGroup;

    .prologue
    .line 189
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsDeleteVote;

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    iget v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    iget v3, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    iget-boolean v4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isBoard:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/polls/PollsDeleteVote;-><init>(IIIZ)V

    new-instance v1, Lcom/vkontakte/android/attachments/PollAttachment$4;

    .line 190
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/attachments/PollAttachment$4;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/content/Context;Landroid/view/ViewGroup;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsDeleteVote;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 214
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 215
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 216
    return-void
.end method

.method private updateAttachViewProgress(Landroid/view/View;Z)V
    .locals 12
    .param p1, "av"    # Landroid/view/View;
    .param p2, "animate"    # Z

    .prologue
    const-wide/16 v10, 0xc8

    const/4 v9, 0x4

    const/high16 v8, 0x42c80000    # 100.0f

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 256
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 257
    .local v0, "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    const v3, 0x7f1004c0

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 258
    .local v2, "percent":Landroid/widget/TextView;
    const-string/jumbo v3, "%.0f %%"

    new-array v4, v6, [Ljava/lang/Object;

    iget v5, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    iget v3, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    iget v4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    if-ne v3, v4, :cond_0

    .line 260
    const v3, -0xae7e48

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 261
    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 266
    :goto_0
    iget v3, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    if-eqz v3, :cond_2

    .line 267
    if-eqz p2, :cond_1

    .line 268
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const-string/jumbo v4, "level"

    new-array v5, v6, [I

    iget v6, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    mul-float/2addr v6, v8

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    aput v6, v5, v7

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 269
    .local v1, "oa":Landroid/animation/ObjectAnimator;
    new-instance v3, Lcom/vkontakte/android/attachments/PollAttachment$6;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment$6;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 275
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 276
    invoke-static {v2, v7}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 297
    .end local v1    # "oa":Landroid/animation/ObjectAnimator;
    :goto_1
    return-void

    .line 263
    :cond_0
    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 264
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 278
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget v4, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    mul-float/2addr v4, v8

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 279
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 282
    :cond_2
    if-eqz p2, :cond_3

    .line 283
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const-string/jumbo v4, "level"

    new-array v5, v6, [I

    aput v7, v5, v7

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 284
    .restart local v1    # "oa":Landroid/animation/ObjectAnimator;
    new-instance v3, Lcom/vkontakte/android/attachments/PollAttachment$7;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment$7;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 290
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 291
    invoke-static {v2, v9}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_1

    .line 293
    .end local v1    # "oa":Landroid/animation/ObjectAnimator;
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 294
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private updateAttachViewText(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 250
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 251
    .local v0, "context":Landroid/content/Context;
    const v1, 0x7f1001dd

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    if-eqz v2, :cond_0

    const v2, 0x7f080501

    :goto_0
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " \u2022 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 252
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0042

    iget v5, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget v8, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 251
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 253
    return-void

    .line 251
    :cond_0
    const v2, 0x7f080505

    goto :goto_0
.end method

.method private updateCachedPost()V
    .locals 4

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;)V

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_0

    .line 221
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "entry"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "bg_only"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 223
    :cond_0
    return-void
.end method

.method private vote(Lcom/vkontakte/android/attachments/PollAttachment$Answer;Landroid/view/ViewGroup;)V
    .locals 5
    .param p1, "a"    # Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    .param p2, "wrap"    # Landroid/view/ViewGroup;

    .prologue
    .line 149
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f1004c1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 150
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsAddVote;

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    iget v2, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    iget v3, p1, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    iget-boolean v4, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isBoard:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/polls/PollsAddVote;-><init>(IIIZ)V

    new-instance v1, Lcom/vkontakte/android/attachments/PollAttachment$3;

    .line 151
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/vkontakte/android/attachments/PollAttachment$3;-><init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/content/Context;Lcom/vkontakte/android/attachments/PollAttachment$Answer;Landroid/view/ViewGroup;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsAddVote;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 185
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 186
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    const v1, 0x7f030051

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 91
    .local v0, "v":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/vkontakte/android/attachments/PollAttachment;->bindView(Landroid/view/View;)V

    .line 92
    invoke-direct {p0, v0}, Lcom/vkontakte/android/attachments/PollAttachment;->reloadIfNeeded(Landroid/view/View;)V

    .line 93
    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 312
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 341
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 4
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 317
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 318
    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 319
    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 320
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 321
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 322
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Serializer$Serializable;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 321
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 324
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 325
    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 326
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 327
    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 328
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->isBoard:Z

    if-eqz v1, :cond_2

    :goto_2
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 329
    return-void

    :cond_1
    move v1, v3

    .line 326
    goto :goto_1

    :cond_2
    move v2, v3

    .line 328
    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 332
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "poll"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
