.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$4;
.super Ljava/lang/Object;
.source "CreateTransferFragment.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 322
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$4;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "keyEvent"    # Landroid/view/KeyEvent;

    .prologue
    .line 325
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$4;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$600(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    .line 327
    const/4 v0, 0x1

    .line 329
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
