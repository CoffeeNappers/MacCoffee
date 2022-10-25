.class final Lcom/vkontakte/android/attachments/Attachment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "Attachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<[",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$post:[Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>([Lcom/vkontakte/android/NewsEntry;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/vkontakte/android/attachments/Attachment$1;->val$post:[Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 199
    check-cast p1, [Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/Attachment$1;->success([Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method public success([Lcom/vkontakte/android/NewsEntry;)V
    .locals 3
    .param p1, "news"    # [Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v2, 0x0

    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/attachments/Attachment$1;->val$post:[Lcom/vkontakte/android/NewsEntry;

    aget-object v1, p1, v2

    aput-object v1, v0, v2

    .line 203
    return-void
.end method
