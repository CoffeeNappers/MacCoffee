.class Lcom/vk/lists/PaginateHelper$4;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lcom/vk/lists/OnRetryClickListener;


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
    .line 107
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$4;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRetryClick()V
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$4;->this$0:Lcom/vk/lists/PaginateHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/lists/PaginateHelper;->access$202(Lcom/vk/lists/PaginateHelper;Z)Z

    .line 111
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$4;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v0}, Lcom/vk/lists/PaginateHelper;->loadNext()V

    .line 112
    return-void
.end method
