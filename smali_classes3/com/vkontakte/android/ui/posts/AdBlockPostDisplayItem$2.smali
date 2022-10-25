.class Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AdBlockPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->hide(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;

.field final synthetic val$a:Lcom/vkontakte/android/attachments/ShitAttachment;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->val$a:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;->val$a:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->access$000(Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 99
    return-void
.end method
