.class public Lcom/vkontakte/android/attachments/PendingDocumentAttachment;
.super Lcom/vkontakte/android/attachments/DocumentAttachment;
.source "PendingDocumentAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingDocumentAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingDocumentAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 0
    .param p1, "parcel"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;)V
    .locals 12
    .param p1, "_title"    # Ljava/lang/String;
    .param p2, "_url"    # Ljava/lang/String;
    .param p3, "_size"    # I
    .param p4, "_thumb"    # Ljava/lang/String;
    .param p5, "_oid"    # I
    .param p6, "_did"    # I
    .param p7, "ext"    # Ljava/lang/String;

    .prologue
    .line 12
    const-string/jumbo v8, ""

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v11}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    .line 13
    return-void
.end method


# virtual methods
.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/DocumentUploadTask;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    new-instance v0, Lcom/vkontakte/android/upload/DocumentUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->url:Ljava/lang/String;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    const/4 v3, 0x1

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    .line 48
    .local v0, "task":Lcom/vkontakte/android/upload/DocumentUploadTask;
    iget v1, p0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->did:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/DocumentUploadTask;->setID(I)V

    .line 49
    return-object v0
.end method

.method public bridge synthetic createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 1

    .prologue
    .line 9
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/DocumentUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->did:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->did:I

    .line 43
    return-void
.end method
