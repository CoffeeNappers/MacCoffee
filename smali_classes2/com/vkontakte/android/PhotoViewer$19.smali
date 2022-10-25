.class Lcom/vkontakte/android/PhotoViewer$19;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->editDescription()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$ed:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 923
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$19;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$19;->val$ed:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 926
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$19;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 927
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$19;->val$ed:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 928
    return-void
.end method
