.class Lcom/vkontakte/android/fragments/GameCardFragment$1;
.super Ljava/lang/Object;
.source "GameCardFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$1;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$1;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showAllRequest:Z

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$1;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->access$100(Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;)V

    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$1;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->build()V

    .line 98
    return-void
.end method
