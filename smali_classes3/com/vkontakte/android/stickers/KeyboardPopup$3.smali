.class Lcom/vkontakte/android/stickers/KeyboardPopup$3;
.super Ljava/lang/Object;
.source "KeyboardPopup.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/KeyboardPopup;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/KeyboardPopup;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/KeyboardPopup;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/vkontakte/android/stickers/KeyboardPopup$3;->this$0:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/stickers/KeyboardPopup$3;->this$0:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->access$000(Lcom/vkontakte/android/stickers/KeyboardPopup;)V

    .line 120
    return-void
.end method
