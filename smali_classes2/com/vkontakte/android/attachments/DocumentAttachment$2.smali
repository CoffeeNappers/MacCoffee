.class Lcom/vkontakte/android/attachments/DocumentAttachment$2;
.super Ljava/lang/Object;
.source "DocumentAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/DocumentAttachment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 178
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->val$context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :cond_0
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    goto :goto_0
.end method
