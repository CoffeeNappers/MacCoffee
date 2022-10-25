.class Lcom/vk/lists/PaginateHelper$2;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper;->bind(Lcom/vk/lists/PaginateHelper$PaginatedView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$2;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$2;->this$0:Lcom/vk/lists/PaginateHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginateHelper;->reload(Z)V

    .line 99
    return-void
.end method
