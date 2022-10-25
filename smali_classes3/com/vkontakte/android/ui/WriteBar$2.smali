.class Lcom/vkontakte/android/ui/WriteBar$2;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 339
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$2;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 342
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$2;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$1800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 343
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/Stickers;->checkServerUpdates()V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$2;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$1800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->toggle()V

    .line 346
    :cond_0
    return-void
.end method
