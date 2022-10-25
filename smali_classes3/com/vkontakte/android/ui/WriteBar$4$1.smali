.class Lcom/vkontakte/android/ui/WriteBar$4$1;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar$4;->onAttachmentRemoved(Lcom/vkontakte/android/attachments/Attachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/WriteBar$4;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar$4;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/WriteBar$4;

    .prologue
    .line 429
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$4$1;->this$1:Lcom/vkontakte/android/ui/WriteBar$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 431
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$4$1;->this$1:Lcom/vkontakte/android/ui/WriteBar$4;

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar$4;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->access$2700(Lcom/vkontakte/android/ui/WriteBar;Z)V

    .line 432
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$4$1;->this$1:Lcom/vkontakte/android/ui/WriteBar$4;

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar$4;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->access$2800(Lcom/vkontakte/android/ui/WriteBar;Z)V

    .line 433
    return-void
.end method
