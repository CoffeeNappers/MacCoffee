.class Lcom/vkontakte/android/PhotoViewer$8;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->initView(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 465
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$8;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 468
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$8;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/PhotoViewer;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
