.class public Lcom/facebook/drawee/view/SimpleDraweeView;
.super Lcom/facebook/drawee/view/GenericDraweeView;
.source "SimpleDraweeView.java"


# static fields
.field private static sDraweeControllerBuilderSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier",
            "<+",
            "Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mSimpleDraweeControllerBuilder:Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/facebook/drawee/view/GenericDraweeView;-><init>(Landroid/content/Context;)V

    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/GenericDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 63
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 67
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/drawee/view/GenericDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 68
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/drawee/view/GenericDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/drawee/generic/GenericDraweeHierarchy;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "hierarchy"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/GenericDraweeView;-><init>(Landroid/content/Context;Lcom/facebook/drawee/generic/GenericDraweeHierarchy;)V

    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 81
    :cond_1
    sget-object v1, Lcom/facebook/drawee/view/SimpleDraweeView;->sDraweeControllerBuilderSupplier:Lcom/facebook/common/internal/Supplier;

    const-string/jumbo v2, "SimpleDraweeView was not initialized!"

    invoke-static {v1, v2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v1, Lcom/facebook/drawee/view/SimpleDraweeView;->sDraweeControllerBuilderSupplier:Lcom/facebook/common/internal/Supplier;

    invoke-interface {v1}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    iput-object v1, p0, Lcom/facebook/drawee/view/SimpleDraweeView;->mSimpleDraweeControllerBuilder:Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    .line 86
    if-eqz p2, :cond_0

    .line 87
    sget-object v1, Lcom/facebook/drawee/R$styleable;->SimpleDraweeView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 91
    .local v0, "gdhAttrs":Landroid/content/res/TypedArray;
    :try_start_0
    sget v1, Lcom/facebook/drawee/R$styleable;->SimpleDraweeView_actualImageUri:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 92
    sget v1, Lcom/facebook/drawee/R$styleable;->SimpleDraweeView_actualImageUri:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Landroid/net/Uri;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    :cond_2
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method public static initialize(Lcom/facebook/common/internal/Supplier;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier",
            "<+",
            "Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "draweeControllerBuilderSupplier":Lcom/facebook/common/internal/Supplier;, "Lcom/facebook/common/internal/Supplier<+Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;>;"
    sput-object p0, Lcom/facebook/drawee/view/SimpleDraweeView;->sDraweeControllerBuilderSupplier:Lcom/facebook/common/internal/Supplier;

    .line 42
    return-void
.end method

.method public static shutDown()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    sput-object v0, Lcom/facebook/drawee/view/SimpleDraweeView;->sDraweeControllerBuilderSupplier:Lcom/facebook/common/internal/Supplier;

    .line 47
    return-void
.end method


# virtual methods
.method protected getControllerBuilder()Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/facebook/drawee/view/SimpleDraweeView;->mSimpleDraweeControllerBuilder:Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    return-object v0
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Landroid/net/Uri;Ljava/lang/Object;)V

    .line 113
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;Ljava/lang/Object;)V
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "callerContext"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 131
    iget-object v1, p0, Lcom/facebook/drawee/view/SimpleDraweeView;->mSimpleDraweeControllerBuilder:Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    .line 132
    invoke-interface {v1, p2}, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;->setCallerContext(Ljava/lang/Object;)Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    move-result-object v1

    .line 133
    invoke-interface {v1, p1}, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;->setUri(Landroid/net/Uri;)Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    move-result-object v1

    .line 134
    invoke-virtual {p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;->setOldController(Lcom/facebook/drawee/interfaces/DraweeController;)Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    move-result-object v1

    .line 135
    invoke-interface {v1}, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;->build()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    .line 136
    .local v0, "controller":Lcom/facebook/drawee/interfaces/DraweeController;
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 137
    return-void
.end method

.method public setImageURI(Ljava/lang/String;)V
    .locals 1
    .param p1, "uriString"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public setImageURI(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "uriString"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "callerContext"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 146
    if-eqz p1, :cond_0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 147
    .local v0, "uri":Landroid/net/Uri;
    :goto_0
    invoke-virtual {p0, v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Landroid/net/Uri;Ljava/lang/Object;)V

    .line 148
    return-void

    .line 146
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
