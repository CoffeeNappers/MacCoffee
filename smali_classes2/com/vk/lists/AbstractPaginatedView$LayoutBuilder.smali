.class public Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;
.super Ljava/lang/Object;
.source "AbstractPaginatedView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/AbstractPaginatedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutBuilder"
.end annotation


# instance fields
.field private final layoutType:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

.field private orientation:I

.field private final paginatedView:Lcom/vk/lists/AbstractPaginatedView;

.field private reverseLayout:Z

.field private spanCount:I


# direct methods
.method public constructor <init>(Lcom/vk/lists/AbstractPaginatedView$LayoutType;Lcom/vk/lists/AbstractPaginatedView;)V
    .locals 1
    .param p1, "layoutType"    # Lcom/vk/lists/AbstractPaginatedView$LayoutType;
    .param p2, "paginatedView"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    const/4 v0, 0x1

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iput v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->spanCount:I

    .line 237
    iput v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->orientation:I

    .line 238
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->reverseLayout:Z

    .line 241
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->layoutType:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    .line 242
    iput-object p2, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->paginatedView:Lcom/vk/lists/AbstractPaginatedView;

    .line 243
    return-void
.end method


# virtual methods
.method public buildAndSet()V
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->paginatedView:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0, p0}, Lcom/vk/lists/AbstractPaginatedView;->setLayoutManagerFromBuilder(Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;)V

    .line 262
    return-void
.end method

.method public getLayoutType()Lcom/vk/lists/AbstractPaginatedView$LayoutType;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->layoutType:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    .prologue
    .line 273
    iget v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->orientation:I

    return v0
.end method

.method public getSpanCount()I
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->spanCount:I

    return v0
.end method

.method public isReverseLayout()Z
    .locals 1

    .prologue
    .line 277
    iget-boolean v0, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->reverseLayout:Z

    return v0
.end method

.method public setOrientation(I)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 251
    iput p1, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->orientation:I

    .line 252
    return-object p0
.end method

.method public setReverseLayout(Z)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;
    .locals 0
    .param p1, "reverseLayout"    # Z

    .prologue
    .line 256
    iput-boolean p1, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->reverseLayout:Z

    .line 257
    return-object p0
.end method

.method public setSpanCount(I)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;
    .locals 0
    .param p1, "spanCount"    # I

    .prologue
    .line 246
    iput p1, p0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->spanCount:I

    .line 247
    return-object p0
.end method
