.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$5;
.super Ljava/lang/Object;
.source "CreateTransferFragment.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    .line 332
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$5;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "b"    # Z

    .prologue
    .line 335
    if-eqz p2, :cond_0

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$5;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$700(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    .line 338
    :cond_0
    return-void
.end method
