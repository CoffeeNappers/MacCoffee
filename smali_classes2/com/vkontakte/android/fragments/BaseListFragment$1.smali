.class Lcom/vkontakte/android/fragments/BaseListFragment$1;
.super Ljava/lang/Object;
.source "BaseListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/BaseListFragment;->createContentView()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/BaseListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/BaseListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/BaseListFragment;

    .prologue
    .line 81
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment$1;, "Lcom/vkontakte/android/fragments/BaseListFragment$1;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/BaseListFragment$1;->this$0:Lcom/vkontakte/android/fragments/BaseListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment$1;, "Lcom/vkontakte/android/fragments/BaseListFragment$1;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment$1;->this$0:Lcom/vkontakte/android/fragments/BaseListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->onEmptyViewBtnClick()V

    .line 85
    return-void
.end method
