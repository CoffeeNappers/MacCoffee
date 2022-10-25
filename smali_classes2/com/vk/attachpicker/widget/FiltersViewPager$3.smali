.class Lcom/vk/attachpicker/widget/FiltersViewPager$3;
.super Ljava/lang/Object;
.source "FiltersViewPager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/widget/FiltersViewPager;->onSizeChanged(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/widget/FiltersViewPager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/widget/FiltersViewPager;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$3;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$3;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->isFakeDragging()Z

    move-result v0

    if-nez v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$3;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->beginFakeDrag()Z

    .line 132
    iget-object v0, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$3;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->isFakeDragging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$3;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->endFakeDrag()V

    .line 136
    :cond_0
    return-void
.end method
