.class public Lcom/vkontakte/android/Message$FwdMessage;
.super Lcom/vkontakte/android/utils/MessageBase;
.source "Message.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FwdMessage"
.end annotation


# instance fields
.field public username:Ljava/lang/String;

.field public userphoto:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 503
    invoke-direct {p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 504
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/Message$FwdMessage;->username:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/Message$FwdMessage;->userphoto:Ljava/lang/String;

    return-void
.end method

.method public static deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/Message$FwdMessage;
    .locals 6
    .param p0, "s"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    new-instance v3, Lcom/vkontakte/android/Message$FwdMessage;

    invoke-direct {v3}, Lcom/vkontakte/android/Message$FwdMessage;-><init>()V

    .line 508
    .local v3, "m":Lcom/vkontakte/android/Message$FwdMessage;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    iput v5, v3, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    .line 509
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    iput v5, v3, Lcom/vkontakte/android/Message$FwdMessage;->time:I

    .line 510
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/Message$FwdMessage;->setText(Ljava/lang/String;)V

    .line 511
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/Message$FwdMessage;->username:Ljava/lang/String;

    .line 512
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/Message$FwdMessage;->userphoto:Ljava/lang/String;

    .line 513
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    iput v5, v3, Lcom/vkontakte/android/Message$FwdMessage;->id:I

    .line 514
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 515
    .local v1, "atts":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 516
    invoke-static {p0}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v0

    .line 517
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v0, :cond_0

    .line 518
    invoke-virtual {v3, v0, v1}, Lcom/vkontakte/android/Message$FwdMessage;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 515
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 521
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 522
    .local v4, "nfwd":I
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v4, :cond_2

    .line 523
    invoke-static {p0}, Lcom/vkontakte/android/Message$FwdMessage;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/Message$FwdMessage;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Lcom/vkontakte/android/Message$FwdMessage;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V

    .line 522
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 525
    :cond_2
    return-object v3
.end method


# virtual methods
.method public serialize(Ljava/io/DataOutputStream;)V
    .locals 2
    .param p1, "s"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 534
    iget v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 535
    iget v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->time:I

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 536
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->text:Ljava/lang/String;

    if-nez v1, :cond_0

    const-string/jumbo v1, ""

    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 537
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->username:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 538
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->userphoto:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 539
    iget v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->id:I

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 540
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 541
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 542
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->attachments:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V

    .line 541
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 536
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->text:Ljava/lang/String;

    goto :goto_0

    .line 544
    .restart local v0    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->fwdMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 545
    const/4 v0, 0x0

    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->fwdMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 546
    iget-object v1, p0, Lcom/vkontakte/android/Message$FwdMessage;->fwdMessages:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message$FwdMessage;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/Message$FwdMessage;->serialize(Ljava/io/DataOutputStream;)V

    .line 545
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 548
    :cond_2
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    .line 529
    iput-object p1, p0, Lcom/vkontakte/android/Message$FwdMessage;->text:Ljava/lang/String;

    .line 530
    invoke-static {p1}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Message$FwdMessage;->displayableText:Ljava/lang/CharSequence;

    .line 531
    return-void
.end method
