.class Lcom/vkontakte/android/ui/WriteBar$8$1;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar$8;->onLayoutChange(Landroid/view/View;IIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/WriteBar$8;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar$8;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/WriteBar$8;

    .prologue
    .line 543
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$8$1;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iput-object p2, p0, Lcom/vkontakte/android/ui/WriteBar$8$1;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 546
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$8$1;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3400(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$8$1;->val$text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->getAutoSuggestStickersFor(Ljava/lang/String;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->showHidePopupWindow(Lcom/vkontakte/android/data/orm/StickersDictionaryItem;)V

    .line 547
    return-void
.end method
