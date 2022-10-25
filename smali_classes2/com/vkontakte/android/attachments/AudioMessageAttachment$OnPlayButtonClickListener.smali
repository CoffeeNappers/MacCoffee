.class Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;
.super Ljava/lang/Object;
.source "AudioMessageAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/AudioMessageAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnPlayButtonClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V
    .locals 0

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p2, "x1"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 228
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 229
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->isFileInCache()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play(Landroid/content/Context;)V

    .line 249
    :goto_0
    return-void

    .line 232
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/docs/DocsGetById;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    iget-object v3, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    iget-object v4, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access_key:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/docs/DocsGetById;-><init>(IILjava/lang/String;)V

    new-instance v2, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;

    invoke-direct {v2, p0, v0, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;Landroid/content/Context;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/docs/DocsGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 247
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
