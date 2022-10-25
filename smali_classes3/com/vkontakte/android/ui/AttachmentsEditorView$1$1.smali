.class Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

.field final synthetic val$vv:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView$1;Landroid/view/View;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;->this$1:Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

    iput-object p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;->val$vv:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;->val$vv:Landroid/view/View;

    const v1, 0x7f1001eb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 153
    return-void
.end method
