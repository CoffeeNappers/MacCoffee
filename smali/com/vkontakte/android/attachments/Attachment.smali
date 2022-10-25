.class public abstract Lcom/vkontakte/android/attachments/Attachment;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Attachment.java"


# static fields
.field private static reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/ActivityLocal",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-direct {v0}, Lcom/vkontakte/android/utils/ActivityLocal;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    return-void
.end method

.method public static appendLocalizedDescription(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 484
    .local p1, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 491
    .end local p0    # "text":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 487
    .restart local p0    # "text":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "desc":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object p0, v0

    .line 489
    goto :goto_0

    .line 491
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;
    .locals 2
    .param p0, "is"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->get(Ljava/io/DataInput;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v0

    const-class v1, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    return-object v0
.end method

.method public static getLocalizedDescription(Lcom/vkontakte/android/attachments/Attachment;)Ljava/lang/String;
    .locals 2
    .param p0, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 427
    instance-of v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v0, :cond_0

    .line 428
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0804a2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 466
    :goto_0
    return-object v0

    .line 429
    :cond_0
    instance-of v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v0, :cond_1

    .line 430
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f08074b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 431
    :cond_1
    instance-of v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v0, :cond_2

    .line 432
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800e1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 433
    :cond_2
    instance-of v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    if-eqz v0, :cond_3

    .line 434
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800ea

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 435
    :cond_3
    instance-of v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v0, :cond_4

    .line 436
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0801b8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 437
    :cond_4
    instance-of v0, p0, Lcom/vkontakte/android/attachments/PostAttachment;

    if-eqz v0, :cond_5

    .line 438
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800dc

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 439
    :cond_5
    instance-of v0, p0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v0, :cond_6

    .line 440
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0804f5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 441
    :cond_6
    instance-of v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-eqz v0, :cond_7

    .line 442
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0806bd

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 443
    :cond_7
    instance-of v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v0, :cond_8

    .line 444
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f080284

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 445
    :cond_8
    instance-of v0, p0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v0, :cond_9

    .line 446
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800db

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 447
    :cond_9
    instance-of v0, p0, Lcom/vkontakte/android/attachments/NoteAttachment;

    if-eqz v0, :cond_a

    .line 448
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800d8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 449
    :cond_a
    instance-of v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;

    if-eqz v0, :cond_b

    .line 450
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800dd

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 451
    :cond_b
    instance-of v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;

    if-eqz v0, :cond_c

    .line 452
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800d7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 453
    :cond_c
    instance-of v0, p0, Lcom/vkontakte/android/attachments/ChronicleAttachment;

    if-eqz v0, :cond_d

    .line 454
    check-cast p0, Lcom/vkontakte/android/attachments/ChronicleAttachment;

    .end local p0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v0, p0, Lcom/vkontakte/android/attachments/ChronicleAttachment;->label:Ljava/lang/String;

    goto/16 :goto_0

    .line 455
    .restart local p0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_d
    instance-of v0, p0, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v0, :cond_e

    .line 456
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f080298

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 457
    :cond_e
    instance-of v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    if-eqz v0, :cond_f

    .line 458
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0804cd

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 459
    :cond_f
    instance-of v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    if-eqz v0, :cond_10

    .line 460
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f08036c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 461
    :cond_10
    instance-of v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v0, :cond_11

    move-object v0, p0

    check-cast v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/SnippetAttachment;->isStory()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 462
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0806cb

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 463
    :cond_11
    instance-of v0, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    if-eqz v0, :cond_12

    .line 464
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f080400

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 466
    :cond_12
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800de

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public static getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v4, 0x0

    .line 471
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 472
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Lcom/vkontakte/android/attachments/Attachment;)Ljava/lang/String;

    move-result-object v2

    .line 480
    :goto_0
    return-object v2

    .line 474
    :cond_0
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    .line 475
    .local v1, "firstType":Ljava/lang/String;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 476
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 477
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f0800df

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 480
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Lcom/vkontakte/android/attachments/Attachment;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 312
    invoke-static {p0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 313
    .local v0, "activity":Landroid/app/Activity;
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 314
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v0, v3}, Lcom/vkontakte/android/utils/ActivityLocal;->put(Landroid/app/Activity;Ljava/lang/Object;)V

    .line 316
    :cond_0
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 317
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    :cond_1
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 322
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    move-object v1, v2

    .line 382
    :cond_2
    :goto_0
    return-object v1

    .line 325
    :cond_3
    const-string/jumbo v2, "common"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 326
    const v2, 0x7f0301b2

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 327
    .local v1, "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 329
    .end local v1    # "v":Landroid/view/View;
    :cond_4
    const-string/jumbo v2, "signature"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 330
    const v2, 0x7f0301b3

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 331
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 333
    .end local v1    # "v":Landroid/view/View;
    :cond_5
    const-string/jumbo v2, "audio"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 335
    new-instance v1, Lcom/vkontakte/android/AudioAttachView;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/AudioAttachView;-><init>(Landroid/content/Context;)V

    .line 336
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 338
    .end local v1    # "v":Landroid/view/View;
    :cond_6
    const-string/jumbo v2, "album"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 339
    const v2, 0x7f030041

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 340
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 342
    .end local v1    # "v":Landroid/view/View;
    :cond_7
    const-string/jumbo v2, "video"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 343
    const v2, 0x7f030056

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 344
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 346
    .end local v1    # "v":Landroid/view/View;
    :cond_8
    const-string/jumbo v2, "video_single"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string/jumbo v2, "video_ads"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 347
    :cond_9
    const v2, 0x7f030057

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 348
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 350
    .end local v1    # "v":Landroid/view/View;
    :cond_a
    const-string/jumbo v2, "photo"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 351
    new-instance v1, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;-><init>(Landroid/content/Context;)V

    .line 352
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 354
    .end local v1    # "v":Landroid/view/View;
    :cond_b
    const-string/jumbo v2, "market_album"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 355
    new-instance v1, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageViewTopCrop;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageViewTopCrop;-><init>(Landroid/content/Context;)V

    .line 356
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 358
    .end local v1    # "v":Landroid/view/View;
    :cond_c
    const-string/jumbo v2, "doc_thumb"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 359
    const v2, 0x7f030047

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 360
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 362
    .end local v1    # "v":Landroid/view/View;
    :cond_d
    const-string/jumbo v2, "repost"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 363
    const v2, 0x7f030238

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 364
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 366
    .end local v1    # "v":Landroid/view/View;
    :cond_e
    const-string/jumbo v2, "animation"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 367
    const v2, 0x7f030042

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 368
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 370
    .end local v1    # "v":Landroid/view/View;
    :cond_f
    const-string/jumbo v2, "audio_message"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 371
    const v2, 0x7f030043

    invoke-static {p0, v2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 372
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 374
    .end local v1    # "v":Landroid/view/View;
    :cond_10
    const-string/jumbo v2, "pretty_cards"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 375
    new-instance v1, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 376
    .local v1, "v":Landroid/support/v7/widget/RecyclerView;
    new-instance v2, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;

    invoke-direct {v2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;-><init>()V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 377
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v2, p0, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 379
    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method public static parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;
    .locals 1
    .param p0, "o"    # Lorg/json/JSONObject;
    .param p1    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vkontakte/android/attachments/Attachment;"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p2, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;
    .locals 48
    .param p0, "o"    # Lorg/json/JSONObject;
    .param p1, "listRefer"    # Ljava/lang/String;
    .param p2    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vkontakte/android/attachments/Attachment;"
        }
    .end annotation

    .prologue
    .line 78
    .local p2, "post_names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p3, "post_photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :try_start_0
    const-string/jumbo v5, "type"

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 79
    .local v42, "type":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v31

    .line 80
    .local v31, "att":Lorg/json/JSONObject;
    invoke-static/range {v42 .. v42}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v5, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 280
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Unknown attachment "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const/4 v5, 0x0

    .line 285
    .end local v31    # "att":Lorg/json/JSONObject;
    .end local v42    # "type":Ljava/lang/String;
    :goto_1
    return-object v5

    .line 80
    .restart local v31    # "att":Lorg/json/JSONObject;
    .restart local v42    # "type":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v8, "market"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v8, "photo"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v8, "graffiti"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v8, "posted_photo"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v8, "album"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v8, "app"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x5

    goto :goto_0

    :sswitch_6
    const-string/jumbo v8, "audio"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x6

    goto :goto_0

    :sswitch_7
    const-string/jumbo v8, "market_album"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x7

    goto :goto_0

    :sswitch_8
    const-string/jumbo v8, "video"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x8

    goto/16 :goto_0

    :sswitch_9
    const-string/jumbo v8, "doc"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x9

    goto/16 :goto_0

    :sswitch_a
    const-string/jumbo v8, "gift"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xa

    goto/16 :goto_0

    :sswitch_b
    const-string/jumbo v8, "link"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xb

    goto/16 :goto_0

    :sswitch_c
    const-string/jumbo v8, "poll"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xc

    goto/16 :goto_0

    :sswitch_d
    const-string/jumbo v8, "note"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xd

    goto/16 :goto_0

    :sswitch_e
    const-string/jumbo v8, "page"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xe

    goto/16 :goto_0

    :sswitch_f
    const-string/jumbo v8, "wall"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xf

    goto/16 :goto_0

    :sswitch_10
    const-string/jumbo v8, "sticker"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x10

    goto/16 :goto_0

    :sswitch_11
    const-string/jumbo v8, "wall_reply"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x11

    goto/16 :goto_0

    :sswitch_12
    const-string/jumbo v8, "chronicle"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x12

    goto/16 :goto_0

    :sswitch_13
    const-string/jumbo v8, "money_transfer"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x13

    goto/16 :goto_0

    :sswitch_14
    const-string/jumbo v8, "audio_playlist"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x14

    goto/16 :goto_0

    :sswitch_15
    const-string/jumbo v8, "pretty_cards"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x15

    goto/16 :goto_0

    .line 82
    :pswitch_0
    new-instance v5, Lcom/vkontakte/android/attachments/MarketAttachment;

    new-instance v6, Lcom/vkontakte/android/data/Good;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/data/Good;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/MarketAttachment;-><init>(Lcom/vkontakte/android/data/Good;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 283
    .end local v31    # "att":Lorg/json/JSONObject;
    .end local v42    # "type":Ljava/lang/String;
    :catch_0
    move-exception v47

    .line 284
    .local v47, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    move-object/from16 v0, v47

    invoke-static {v5, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 84
    .end local v47    # "x":Ljava/lang/Exception;
    .restart local v31    # "att":Lorg/json/JSONObject;
    .restart local v42    # "type":Ljava/lang/String;
    :pswitch_1
    :try_start_1
    const-string/jumbo v5, "sizes"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v40

    .line 85
    .local v40, "sizes":Lorg/json/JSONArray;
    if-eqz v40, :cond_1

    .line 86
    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    new-instance v6, Lcom/vkontakte/android/Photo;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    goto/16 :goto_1

    .line 88
    :cond_1
    new-instance v4, Lcom/vkontakte/android/attachments/PhotoAttachment;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/4 v6, 0x0

    new-instance v8, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v9, 0x6d

    const-string/jumbo v10, "src"

    .line 89
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v8, v9, v10, v11, v12}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v8, v5, v6

    const/4 v6, 0x1

    new-instance v8, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v9, 0x78

    const-string/jumbo v10, "src_big"

    .line 90
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v8, v9, v10, v11, v12}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v8, v5, v6

    const/4 v6, 0x2

    new-instance v8, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v9, 0x79

    const-string/jumbo v10, "src_xbig"

    const/4 v11, 0x0

    .line 91
    move-object/from16 v0, v31

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v8, v9, v10, v11, v12}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v8, v5, v6

    const-string/jumbo v6, "owner_id"

    .line 92
    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v8, "id"

    const-string/jumbo v9, "gid"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    neg-int v9, v9

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    const-string/jumbo v8, "aid"

    const/4 v9, -0x7

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const-string/jumbo v9, "text"

    .line 93
    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "user_id"

    const-string/jumbo v11, "owner_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    move-object/from16 v0, v31

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    const-string/jumbo v11, "created"

    .line 94
    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    const-string/jumbo v12, "access_key"

    const-string/jumbo v17, ""

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v12, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const-wide v14, -0x3f3e6c0000000000L    # -9000.0

    const-wide v16, -0x3f3e6c0000000000L    # -9000.0

    invoke-direct/range {v4 .. v17}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;IILjava/lang/String;IDD)V

    move-object v5, v4

    goto/16 :goto_1

    .line 97
    .end local v40    # "sizes":Lorg/json/JSONArray;
    :pswitch_2
    new-instance v4, Lcom/vkontakte/android/attachments/PhotoAttachment;

    const-string/jumbo v5, "photo_200"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "photo_586"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "owner_id"

    .line 98
    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v8, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/high16 v9, -0x80000000

    invoke-direct/range {v4 .. v9}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;III)V

    .line 99
    .local v4, "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "m"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0xc8

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 100
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "m"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x64

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 101
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "x"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x24a

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 102
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "x"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x125

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    move-object v5, v4

    .line 103
    goto/16 :goto_1

    .line 105
    .end local v4    # "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :pswitch_3
    new-instance v4, Lcom/vkontakte/android/attachments/PhotoAttachment;

    const-string/jumbo v5, "photo_130"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "photo_604"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "owner_id"

    .line 106
    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v8, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/high16 v9, -0x80000000

    invoke-direct/range {v4 .. v9}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;III)V

    .line 107
    .restart local v4    # "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "m"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x82

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 108
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "m"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x62

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 109
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "x"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x25c

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 110
    iget-object v5, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "x"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v6, 0x1e0

    iput v6, v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    move-object v5, v4

    .line 111
    goto/16 :goto_1

    .line 113
    .end local v4    # "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :pswitch_4
    const-string/jumbo v5, "thumb"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "sizes"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v40

    .line 114
    .restart local v40    # "sizes":Lorg/json/JSONArray;
    if-eqz v40, :cond_3

    .line 115
    new-instance v37, Ljava/util/ArrayList;

    invoke-direct/range {v37 .. v37}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .local v37, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    const/16 v33, 0x0

    .local v33, "i":I
    :goto_2
    invoke-virtual/range {v40 .. v40}, Lorg/json/JSONArray;->length()I

    move-result v5

    move/from16 v0, v33

    if-ge v0, v5, :cond_2

    .line 117
    move-object/from16 v0, v40

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v41

    .line 118
    .local v41, "so":Lorg/json/JSONObject;
    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const-string/jumbo v6, "type"

    const-string/jumbo v8, "?"

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const-string/jumbo v8, "src"

    .line 119
    move-object/from16 v0, v41

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "width"

    move-object/from16 v0, v41

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    const-string/jumbo v10, "height"

    move-object/from16 v0, v41

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-direct {v5, v6, v8, v9, v10}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    .line 118
    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    add-int/lit8 v33, v33, 0x1

    goto :goto_2

    .line 121
    .end local v41    # "so":Lorg/json/JSONObject;
    :cond_2
    new-instance v5, Lcom/vkontakte/android/attachments/AlbumAttachment;

    const/4 v6, 0x0

    new-array v6, v6, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    move-object/from16 v0, v37

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const-string/jumbo v8, "owner_id"

    .line 122
    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v8, "pid"

    const/4 v9, -0x1

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const-string/jumbo v9, "id"

    const/4 v10, -0x7

    move-object/from16 v0, v31

    invoke-virtual {v0, v9, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v9

    const-string/jumbo v10, "title"

    .line 123
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "size"

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-direct/range {v5 .. v11}, Lcom/vkontakte/android/attachments/AlbumAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;I)V

    goto/16 :goto_1

    .line 125
    .end local v33    # "i":I
    .end local v37    # "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    :cond_3
    new-instance v5, Lcom/vkontakte/android/attachments/AlbumAttachment;

    const/4 v6, 0x3

    new-array v6, v6, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/4 v8, 0x0

    new-instance v9, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v10, 0x6d

    const-string/jumbo v11, "thumb"

    .line 126
    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v12, "src"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v9, v10, v11, v12, v0}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v9, v6, v8

    const/4 v8, 0x1

    new-instance v9, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v10, 0x78

    const-string/jumbo v11, "thumb"

    .line 127
    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v12, "src_big"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v9, v10, v11, v12, v0}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v9, v6, v8

    const/4 v8, 0x2

    new-instance v9, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v10, 0x79

    const-string/jumbo v11, "thumb"

    .line 128
    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v12, "src_xbig"

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v11, v12, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v9, v10, v11, v12, v0}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v9, v6, v8

    const-string/jumbo v8, "owner_id"

    .line 129
    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v8, "pid"

    const-string/jumbo v9, "gid"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    neg-int v9, v9

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const-string/jumbo v9, "aid"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    const-string/jumbo v10, "title"

    .line 130
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "size"

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-direct/range {v5 .. v11}, Lcom/vkontakte/android/attachments/AlbumAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;I)V

    goto/16 :goto_1

    .line 133
    .end local v40    # "sizes":Lorg/json/JSONArray;
    :pswitch_5
    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    const-string/jumbo v6, "src"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-direct/range {v5 .. v10}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;III)V

    goto/16 :goto_1

    .line 135
    :pswitch_6
    new-instance v5, Lcom/vkontakte/android/attachments/AudioAttachment;

    new-instance v6, Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_1

    .line 137
    :pswitch_7
    new-instance v5, Lcom/vkontakte/android/attachments/MarketAlbumAttachment;

    new-instance v6, Lcom/vkontakte/android/data/GoodAlbum;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/data/GoodAlbum;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/MarketAlbumAttachment;-><init>(Lcom/vkontakte/android/data/GoodAlbum;)V

    goto/16 :goto_1

    .line 139
    :pswitch_8
    new-instance v46, Lcom/vkontakte/android/api/VideoFile;

    move-object/from16 v0, v46

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 140
    .local v46, "vf":Lcom/vkontakte/android/api/VideoFile;
    if-eqz p2, :cond_4

    .line 141
    move-object/from16 v0, v46

    iget v5, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object/from16 v0, v46

    iput-object v5, v0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 143
    :cond_4
    if-eqz p3, :cond_5

    .line 144
    move-object/from16 v0, v46

    iget v5, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object/from16 v0, v46

    iput-object v5, v0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 146
    :cond_5
    new-instance v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v46

    invoke-direct {v5, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    goto/16 :goto_1

    .line 148
    .end local v46    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :pswitch_9
    const-string/jumbo v5, "preview"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v39

    .line 149
    .local v39, "preview":Lorg/json/JSONObject;
    if-eqz v39, :cond_8

    .line 150
    const-string/jumbo v5, "graffiti"

    move-object/from16 v0, v39

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 151
    new-instance v5, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    new-instance v6, Lcom/vkontakte/android/api/Document;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/api/Document;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    goto/16 :goto_1

    .line 152
    :cond_6
    const-string/jumbo v5, "audio_msg"

    move-object/from16 v0, v39

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 153
    new-instance v5, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    new-instance v6, Lcom/vkontakte/android/api/Document;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/api/Document;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    goto/16 :goto_1

    .line 155
    :cond_7
    new-instance v5, Lcom/vkontakte/android/attachments/DocumentAttachment;

    new-instance v6, Lcom/vkontakte/android/api/Document;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/api/Document;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    goto/16 :goto_1

    .line 158
    :cond_8
    new-instance v5, Lcom/vkontakte/android/attachments/DocumentAttachment;

    new-instance v6, Lcom/vkontakte/android/api/Document;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/api/Document;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    goto/16 :goto_1

    .line 161
    .end local v39    # "preview":Lorg/json/JSONObject;
    :pswitch_a
    new-instance v5, Lcom/vkontakte/android/attachments/GiftAttachment;

    const-string/jumbo v6, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    const-string/jumbo v10, "thumb_48"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-string/jumbo v10, "thumb_96"

    .line 162
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const-string/jumbo v10, "thumb_256"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const-string/jumbo v9, "stickers_product_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v5, v6, v8, v9}, Lcom/vkontakte/android/attachments/GiftAttachment;-><init>(I[Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 164
    :pswitch_b
    const-string/jumbo v5, "photo"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 165
    const-string/jumbo v5, "product"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    const-string/jumbo v5, "product"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "price"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "text"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 167
    .local v7, "descr":Ljava/lang/String;
    :goto_3
    const-string/jumbo v13, ""

    .local v13, "btn":Ljava/lang/String;
    const-string/jumbo v14, ""

    .line 168
    .local v14, "btnLink":Ljava/lang/String;
    const/16 v18, 0x0

    .line 169
    .local v18, "buttonAction":Lcom/vkontakte/android/api/ButtonAction;
    const-string/jumbo v5, "button"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 170
    const-string/jumbo v5, "button"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 171
    const-string/jumbo v5, "button"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "url"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 172
    const-string/jumbo v5, "button"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "action"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v32

    .line 173
    .local v32, "buttonActionJson":Lorg/json/JSONObject;
    if-eqz v32, :cond_9

    .line 174
    new-instance v18, Lcom/vkontakte/android/api/ButtonAction;

    .end local v18    # "buttonAction":Lcom/vkontakte/android/api/ButtonAction;
    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/ButtonAction;-><init>(Lorg/json/JSONObject;)V

    .line 177
    .end local v32    # "buttonActionJson":Lorg/json/JSONObject;
    .restart local v18    # "buttonAction":Lcom/vkontakte/android/api/ButtonAction;
    :cond_9
    const/4 v15, 0x0

    .line 178
    .local v15, "rating":F
    const/16 v16, 0x0

    .line 179
    .local v16, "reviewCount":I
    const-string/jumbo v5, "rating"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 180
    const-string/jumbo v5, "rating"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "stars"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    double-to-float v15, v8

    .line 181
    const-string/jumbo v5, "rating"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "reviews_count"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 183
    :cond_a
    new-instance v5, Lcom/vkontakte/android/attachments/SnippetAttachment;

    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "caption"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "url"

    .line 184
    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "target"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lcom/vkontakte/android/Photo;

    const-string/jumbo v12, "photo"

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    const-string/jumbo v12, "product"

    .line 185
    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    const-string/jumbo v17, "preview_page"

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v5 .. v18}, Lcom/vkontakte/android/attachments/SnippetAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/Photo;ZLjava/lang/String;Ljava/lang/String;FILjava/lang/String;Lcom/vkontakte/android/api/ButtonAction;)V

    goto/16 :goto_1

    .line 165
    .end local v7    # "descr":Ljava/lang/String;
    .end local v13    # "btn":Ljava/lang/String;
    .end local v14    # "btnLink":Ljava/lang/String;
    .end local v15    # "rating":F
    .end local v16    # "reviewCount":I
    .end local v18    # "buttonAction":Lcom/vkontakte/android/api/ButtonAction;
    :cond_b
    const-string/jumbo v5, "description"

    .line 166
    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_3

    .line 187
    :cond_c
    new-instance v5, Lcom/vkontakte/android/attachments/LinkAttachment;

    const-string/jumbo v6, "url"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "title"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "preview_page"

    const-string/jumbo v10, ""

    move-object/from16 v0, v31

    invoke-virtual {v0, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v5, v6, v8, v9}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 189
    :pswitch_c
    new-instance v5, Lcom/vkontakte/android/attachments/PollAttachment;

    move-object/from16 v0, v31

    invoke-direct {v5, v0}, Lcom/vkontakte/android/attachments/PollAttachment;-><init>(Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 191
    :pswitch_d
    new-instance v5, Lcom/vkontakte/android/attachments/NoteAttachment;

    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "owner_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const-string/jumbo v9, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v5, v6, v8, v9}, Lcom/vkontakte/android/attachments/NoteAttachment;-><init>(Ljava/lang/String;II)V

    goto/16 :goto_1

    .line 193
    :pswitch_e
    new-instance v5, Lcom/vkontakte/android/attachments/WikiAttachment;

    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v8, "section"

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "group_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    neg-int v9, v9

    const-string/jumbo v10, "page_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    invoke-direct {v5, v6, v8, v9, v10}, Lcom/vkontakte/android/attachments/WikiAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    goto/16 :goto_1

    .line 196
    :pswitch_f
    const-string/jumbo v5, "copy_post_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_d

    const-string/jumbo v5, "copy_history"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 197
    :cond_d
    const/4 v5, 0x1

    new-array v0, v5, [Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v38, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput-object v6, v38, v5

    .line 198
    .local v38, "post":[Lcom/vkontakte/android/NewsEntry;
    new-instance v5, Lcom/vkontakte/android/api/wall/WallGetById;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "to_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;-><init>([Ljava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/attachments/Attachment$1;

    move-object/from16 v0, v38

    invoke-direct {v6, v0}, Lcom/vkontakte/android/attachments/Attachment$1;-><init>([Lcom/vkontakte/android/NewsEntry;)V

    .line 199
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 205
    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 206
    const/4 v5, 0x0

    aget-object v5, v38, v5

    if-nez v5, :cond_e

    const/4 v5, 0x0

    goto/16 :goto_1

    :cond_e
    new-instance v5, Lcom/vkontakte/android/attachments/PostAttachment;

    const/4 v6, 0x0

    aget-object v6, v38, v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    goto/16 :goto_1

    .line 208
    .end local v38    # "post":[Lcom/vkontakte/android/NewsEntry;
    :cond_f
    new-instance v34, Landroid/util/SparseArray;

    invoke-direct/range {v34 .. v34}, Landroid/util/SparseArray;-><init>()V

    .local v34, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v36, Landroid/util/SparseArray;

    invoke-direct/range {v36 .. v36}, Landroid/util/SparseArray;-><init>()V

    .line 209
    .local v36, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-string/jumbo v5, "from"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v44

    .line 210
    .local v44, "users1":Lorg/json/JSONObject;
    const-string/jumbo v5, "copy_owner"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v45

    .line 211
    .local v45, "users2":Lorg/json/JSONObject;
    if-eqz v44, :cond_17

    .line 212
    const/16 v33, 0x0

    .restart local v33    # "i":I
    :goto_4
    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->length()I

    move-result v5

    move/from16 v0, v33

    if-ge v0, v5, :cond_17

    .line 213
    const-string/jumbo v5, "id"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 214
    const-string/jumbo v5, "id"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v43

    .line 215
    .local v43, "uid":I
    const-string/jumbo v5, "first_name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 216
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "first_name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "last_name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 217
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_10

    const-string/jumbo v5, "photo_100"

    :goto_5
    const-string/jumbo v6, ""

    move-object/from16 v0, v44

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 212
    :goto_6
    add-int/lit8 v33, v33, 0x1

    goto :goto_4

    .line 217
    :cond_10
    const-string/jumbo v5, "photo_50"

    goto :goto_5

    .line 219
    :cond_11
    move/from16 v0, v43

    neg-int v5, v0

    const-string/jumbo v6, "name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v34

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 220
    move/from16 v0, v43

    neg-int v6, v0

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v8

    if-lez v5, :cond_12

    const-string/jumbo v5, "photo_100"

    :goto_7
    const-string/jumbo v8, ""

    move-object/from16 v0, v44

    invoke-virtual {v0, v5, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    invoke-virtual {v0, v6, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_6

    :cond_12
    const-string/jumbo v5, "photo_50"

    goto :goto_7

    .line 222
    .end local v43    # "uid":I
    :cond_13
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 223
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v43

    .line 224
    .restart local v43    # "uid":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "first_name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "last_name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 225
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_14

    const-string/jumbo v5, "photo_medium_rec"

    :goto_8
    const-string/jumbo v6, ""

    move-object/from16 v0, v44

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_6

    :cond_14
    const-string/jumbo v5, "photo_rec"

    goto :goto_8

    .line 227
    .end local v43    # "uid":I
    :cond_15
    const-string/jumbo v5, "gid"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    neg-int v0, v5

    move/from16 v43, v0

    .line 228
    .restart local v43    # "uid":I
    const-string/jumbo v5, "name"

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 229
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_16

    const-string/jumbo v5, "photo_100"

    :goto_9
    const-string/jumbo v6, ""

    move-object/from16 v0, v44

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_6

    :cond_16
    const-string/jumbo v5, "photo_50"

    goto :goto_9

    .line 233
    .end local v33    # "i":I
    .end local v43    # "uid":I
    :cond_17
    if-eqz v45, :cond_1e

    .line 234
    const/16 v33, 0x0

    .restart local v33    # "i":I
    :goto_a
    invoke-virtual/range {v45 .. v45}, Lorg/json/JSONObject;->length()I

    move-result v5

    move/from16 v0, v33

    if-ge v0, v5, :cond_1e

    .line 235
    const-string/jumbo v5, "id"

    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 236
    const-string/jumbo v5, "id"

    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v43

    .line 237
    .restart local v43    # "uid":I
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_19

    const-string/jumbo v5, "photo_medium_rec"

    :goto_b
    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 238
    .local v35, "ph":Ljava/lang/String;
    if-nez v35, :cond_18

    .line 239
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1a

    const-string/jumbo v5, "photo_100"

    :goto_c
    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 241
    :cond_18
    const-string/jumbo v5, "first_name"

    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 242
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "first_name"

    move-object/from16 v0, v45

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "last_name"

    move-object/from16 v0, v45

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 243
    move-object/from16 v0, v36

    move/from16 v1, v43

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 234
    .end local v35    # "ph":Ljava/lang/String;
    :goto_d
    add-int/lit8 v33, v33, 0x1

    goto/16 :goto_a

    .line 237
    :cond_19
    const-string/jumbo v5, "photo_rec"

    goto :goto_b

    .line 239
    .restart local v35    # "ph":Ljava/lang/String;
    :cond_1a
    const-string/jumbo v5, "photo_50"

    goto :goto_c

    .line 245
    :cond_1b
    move/from16 v0, v43

    neg-int v5, v0

    const-string/jumbo v6, "name"

    move-object/from16 v0, v45

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v34

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 246
    move/from16 v0, v43

    neg-int v5, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v35

    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_d

    .line 249
    .end local v35    # "ph":Ljava/lang/String;
    .end local v43    # "uid":I
    :cond_1c
    const-string/jumbo v5, "gid"

    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    neg-int v0, v5

    move/from16 v43, v0

    .line 250
    .restart local v43    # "uid":I
    const-string/jumbo v5, "name"

    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 251
    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1d

    const-string/jumbo v5, "photo"

    :goto_e
    move-object/from16 v0, v45

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    move/from16 v1, v43

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_d

    :cond_1d
    const-string/jumbo v5, "photo_medium"

    goto :goto_e

    .line 255
    .end local v33    # "i":I
    .end local v43    # "uid":I
    :cond_1e
    new-instance v5, Lcom/vkontakte/android/attachments/PostAttachment;

    new-instance v6, Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, v31

    move-object/from16 v1, p1

    move-object/from16 v2, v34

    move-object/from16 v3, v36

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    goto/16 :goto_1

    .line 257
    .end local v34    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v36    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v44    # "users1":Lorg/json/JSONObject;
    .end local v45    # "users2":Lorg/json/JSONObject;
    :pswitch_10
    const/4 v5, 0x3

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/4 v5, 0x0

    const-string/jumbo v6, "photo_64"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v21, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "photo_128"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v21, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "photo_256"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v21, v5

    .line 258
    .local v21, "imgs":[Ljava/lang/String;
    const-string/jumbo v5, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v20

    .line 259
    .local v20, "id":I
    new-instance v19, Lcom/vkontakte/android/attachments/StickerAttachment;

    const-string/jumbo v5, "width"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    const-string/jumbo v5, "height"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    const-string/jumbo v5, "product_id"

    const/4 v6, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v24

    invoke-direct/range {v19 .. v24}, Lcom/vkontakte/android/attachments/StickerAttachment;-><init>(I[Ljava/lang/String;III)V

    move-object/from16 v5, v19

    goto/16 :goto_1

    .line 261
    .end local v20    # "id":I
    .end local v21    # "imgs":[Ljava/lang/String;
    :pswitch_11
    const/4 v5, 0x1

    new-array v0, v5, [Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v38, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput-object v6, v38, v5

    .line 262
    .restart local v38    # "post":[Lcom/vkontakte/android/NewsEntry;
    new-instance v5, Lcom/vkontakte/android/api/wall/WallGetById;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "owner_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "post_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;-><init>([Ljava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/attachments/Attachment$2;

    move-object/from16 v0, v38

    invoke-direct {v6, v0}, Lcom/vkontakte/android/attachments/Attachment$2;-><init>([Lcom/vkontakte/android/NewsEntry;)V

    .line 263
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 269
    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 270
    const/4 v5, 0x0

    aget-object v5, v38, v5

    if-eqz v5, :cond_1f

    new-instance v5, Lcom/vkontakte/android/attachments/PostAttachment;

    const/4 v6, 0x0

    aget-object v6, v38, v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    goto/16 :goto_1

    :cond_1f
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 272
    .end local v38    # "post":[Lcom/vkontakte/android/NewsEntry;
    :pswitch_12
    new-instance v22, Lcom/vkontakte/android/attachments/ChronicleAttachment;

    const-string/jumbo v5, "id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    const-string/jumbo v5, "owner_id"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v24

    const-string/jumbo v5, "app_name"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    const-string/jumbo v5, "caption"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    const-string/jumbo v5, "package"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    const-string/jumbo v5, "label"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v5, "src_blur"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string/jumbo v5, "src_big"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    invoke-direct/range {v22 .. v30}, Lcom/vkontakte/android/attachments/ChronicleAttachment;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v5, v22

    goto/16 :goto_1

    .line 274
    :pswitch_13
    new-instance v5, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    new-instance v6, Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vkontakte/android/MoneyTransfer;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;-><init>(Lcom/vkontakte/android/MoneyTransfer;)V

    goto/16 :goto_1

    .line 276
    :pswitch_14
    new-instance v5, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    new-instance v6, Lcom/vk/music/dto/Playlist;

    move-object/from16 v0, v31

    invoke-direct {v6, v0}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;-><init>(Lcom/vk/music/dto/Playlist;)V

    goto/16 :goto_1

    .line 278
    :pswitch_15
    new-instance v5, Lcom/vkontakte/android/attachments/PrettyCardAttachment;

    move-object/from16 v0, v31

    invoke-direct {v5, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment;-><init>(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 80
    nop

    :sswitch_data_0
    .sparse-switch
        -0x773bf7cb -> :sswitch_11
        -0x70aaf6c3 -> :sswitch_10
        -0x40736bc4 -> :sswitch_0
        -0x23df32a1 -> :sswitch_12
        -0x9dc7da6 -> :sswitch_15
        0x17a21 -> :sswitch_5
        0x18538 -> :sswitch_9
        0x306930 -> :sswitch_a
        0x32affa -> :sswitch_b
        0x33aff2 -> :sswitch_d
        0x34628f -> :sswitch_e
        0x3497bf -> :sswitch_c
        0x3791ca -> :sswitch_f
        0x572d8c8 -> :sswitch_2
        0x5897e6f -> :sswitch_4
        0x58d9bd6 -> :sswitch_6
        0x65b3e32 -> :sswitch_1
        0x6b0147b -> :sswitch_8
        0xb61081b -> :sswitch_14
        0xe6958ac -> :sswitch_7
        0x271f7332 -> :sswitch_3
        0x6b42a08a -> :sswitch_13
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method

.method public static parseGeo(Lorg/json/JSONObject;)Lcom/vkontakte/android/attachments/GeoAttachment;
    .locals 13
    .param p0, "j"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v8, -0x1

    const/4 v1, 0x1

    .line 290
    const-string/jumbo v7, "coordinates"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 291
    .local v11, "coords":Ljava/lang/String;
    const-string/jumbo v7, " "

    invoke-virtual {v11, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 292
    .local v0, "c2":[Ljava/lang/String;
    aget-object v7, v0, v6

    invoke-static {v7}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .local v2, "lat":D
    aget-object v7, v0, v1

    invoke-static {v7}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 293
    .local v4, "lon":D
    const-string/jumbo v7, "place"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 294
    new-instance v12, Lcom/vkontakte/android/GeoPlace;

    const-string/jumbo v7, "place"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v12, v7}, Lcom/vkontakte/android/GeoPlace;-><init>(Lorg/json/JSONObject;)V

    .line 295
    .local v12, "place":Lcom/vkontakte/android/GeoPlace;
    const/4 v10, 0x0

    .line 296
    .local v10, "style":I
    const-string/jumbo v7, "type"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v8, :pswitch_data_0

    .line 304
    :goto_1
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v6, v12, Lcom/vkontakte/android/GeoPlace;->title:Ljava/lang/String;

    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    :goto_2
    iget v8, v12, Lcom/vkontakte/android/GeoPlace;->id:I

    iget-object v9, v12, Lcom/vkontakte/android/GeoPlace;->photo:Ljava/lang/String;

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 308
    .end local v12    # "place":Lcom/vkontakte/android/GeoPlace;
    :goto_3
    return-object v1

    .line 296
    .restart local v12    # "place":Lcom/vkontakte/android/GeoPlace;
    :sswitch_0
    const-string/jumbo v9, "point"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v8, v6

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "place"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v8, v1

    goto :goto_0

    .line 298
    :pswitch_0
    const-string/jumbo v6, "showmap"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    if-ne v6, v1, :cond_1

    const/4 v10, 0x3

    .line 299
    :goto_4
    goto :goto_1

    :cond_1
    move v10, v1

    .line 298
    goto :goto_4

    .line 301
    :pswitch_1
    const/4 v10, 0x2

    goto :goto_1

    .line 304
    :cond_2
    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->city:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->country:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    const-string/jumbo v7, ""

    goto :goto_2

    :cond_3
    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->country:Ljava/lang/String;

    goto :goto_2

    :cond_4
    iget-object v7, v12, Lcom/vkontakte/android/GeoPlace;->city:Ljava/lang/String;

    goto :goto_2

    .line 306
    .end local v10    # "style":I
    .end local v12    # "place":Lcom/vkontakte/android/GeoPlace;
    :cond_5
    const/4 v10, 0x0

    .line 308
    .restart local v10    # "style":I
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    const-string/jumbo v6, "title"

    const-string/jumbo v7, "subtitle"

    const/4 v9, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_3

    .line 296
    nop

    :sswitch_data_0
    .sparse-switch
        0x65cd907 -> :sswitch_1
        0x65e5590 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static reuseView(Landroid/view/View;Ljava/lang/String;)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 386
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 387
    .local v1, "context":Landroid/content/Context;
    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 388
    .local v0, "activity":Landroid/app/Activity;
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 389
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v0, v3}, Lcom/vkontakte/android/utils/ActivityLocal;->put(Landroid/app/Activity;Ljava/lang/Object;)V

    .line 391
    :cond_0
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 392
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    :cond_1
    sget-object v2, Lcom/vkontakte/android/attachments/Attachment;->reusableViews:Lcom/vkontakte/android/utils/ActivityLocal;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/utils/ActivityLocal;->get(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    const-string/jumbo v2, "photo"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v2, p0

    .line 396
    check-cast v2, Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 398
    :cond_2
    const-string/jumbo v2, "doc_thumb"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 399
    check-cast p0, Lcom/vkontakte/android/DocAttachView;

    .end local p0    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->reset()V

    .line 401
    :cond_3
    return-void
.end method

.method public static sort(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 404
    .local p0, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .local v4, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .local v1, "albums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .local v5, "videos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .local v2, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 405
    .local v3, "others":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 406
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v7, v0, Lcom/vkontakte/android/attachments/AlbumAttachment;

    if-eqz v7, :cond_0

    .line 407
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 408
    :cond_0
    instance-of v7, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v7, :cond_1

    .line 409
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 410
    :cond_1
    instance-of v7, v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v7, :cond_2

    .line 411
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 412
    :cond_2
    instance-of v7, v0, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-nez v7, :cond_3

    instance-of v7, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-nez v7, :cond_3

    instance-of v7, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v7, :cond_4

    .line 413
    :cond_3
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 415
    :cond_4
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 418
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 419
    invoke-interface {p0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 420
    invoke-interface {p0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 421
    invoke-interface {p0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 422
    invoke-interface {p0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 423
    invoke-interface {p0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 424
    return-void
.end method


# virtual methods
.method public abstract getFullView(Landroid/content/Context;)Landroid/view/View;
.end method

.method public abstract getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 59
    const/4 v0, 0x0

    return-object v0
.end method

.method public final serialize(Ljava/io/DataOutputStream;)V
    .locals 1
    .param p1, "os"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->get(Ljava/io/DataOutput;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 66
    return-void
.end method
