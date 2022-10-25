.class public Lcom/vk/lists/PaginateHelper$Builder;
.super Ljava/lang/Object;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

.field private defaultNextFrom:Ljava/lang/String;

.field private loadingEnabledByDefault:Z

.field private loadingStartOffset:I

.field private pageSize:I

.field private final pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

.field private final pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

.field private preloadCallback:Lcom/vk/lists/PreloadCallback;

.field private preloadCount:I

.field private reloadOnBind:Z

.field private uiControl:Lcom/vk/lists/PaginateHelper$UIControl;


# direct methods
.method public constructor <init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;)V
    .locals 2
    .param p1, "pagedDataProviderWithOffset"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    .prologue
    const/4 v1, 0x1

    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 377
    const/16 v0, 0xa

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingStartOffset:I

    .line 380
    iput-boolean v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingEnabledByDefault:Z

    .line 381
    const/16 v0, 0x1e

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->pageSize:I

    .line 382
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->defaultNextFrom:Ljava/lang/String;

    .line 383
    iput-boolean v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->reloadOnBind:Z

    .line 385
    const/4 v0, 0x3

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCount:I

    .line 389
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    .line 390
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    .line 391
    return-void
.end method

.method public constructor <init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;)V
    .locals 2
    .param p1, "pagedDataProviderWithStartFrom"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    .prologue
    const/4 v1, 0x1

    .line 393
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 377
    const/16 v0, 0xa

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingStartOffset:I

    .line 380
    iput-boolean v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingEnabledByDefault:Z

    .line 381
    const/16 v0, 0x1e

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->pageSize:I

    .line 382
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->defaultNextFrom:Ljava/lang/String;

    .line 383
    iput-boolean v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->reloadOnBind:Z

    .line 385
    const/4 v0, 0x3

    iput v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCount:I

    .line 394
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    .line 395
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    .line 396
    return-void
.end method


# virtual methods
.method public buildAndBind(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/PaginateHelper;
    .locals 1
    .param p1, "abstractPaginatedView"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    .line 465
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView;->getUIControl()Lcom/vk/lists/PaginateHelper$UIControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper$Builder;->setUIControl(Lcom/vk/lists/PaginateHelper$UIControl;)Lcom/vk/lists/PaginateHelper$Builder;

    .line 466
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView;->getDataInfoProvider()Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper$Builder;->setDataInfoProvider(Lcom/vk/lists/PaginateHelper$DataInfoProvider;)Lcom/vk/lists/PaginateHelper$Builder;

    .line 467
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView;->getPaginatedView()Lcom/vk/lists/PaginateHelper$PaginatedView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper$Builder;->buildAndBind(Lcom/vk/lists/PaginateHelper$PaginatedView;)Lcom/vk/lists/PaginateHelper;

    move-result-object v0

    return-object v0
.end method

.method public buildAndBind(Lcom/vk/lists/PaginateHelper$PaginatedView;)Lcom/vk/lists/PaginateHelper;
    .locals 11
    .param p1, "paginatedView"    # Lcom/vk/lists/PaginateHelper$PaginatedView;

    .prologue
    const/4 v10, 0x0

    .line 449
    new-instance v0, Lcom/vk/lists/PaginateHelper;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper$Builder;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    iget-object v3, p0, Lcom/vk/lists/PaginateHelper$Builder;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    iget-object v4, p0, Lcom/vk/lists/PaginateHelper$Builder;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    iget-object v5, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    if-eqz v5, :cond_0

    new-instance v5, Lcom/vk/lists/PreloadScrollListener;

    iget v6, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCount:I

    iget-object v7, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    iget-object v8, p0, Lcom/vk/lists/PaginateHelper$Builder;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    invoke-direct {v5, v6, v7, v8}, Lcom/vk/lists/PreloadScrollListener;-><init>(ILcom/vk/lists/PreloadCallback;Lcom/vk/lists/PaginateHelper$DataInfoProvider;)V

    :goto_0
    iget v6, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingStartOffset:I

    iget-boolean v7, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingEnabledByDefault:Z

    iget v8, p0, Lcom/vk/lists/PaginateHelper$Builder;->pageSize:I

    iget-object v9, p0, Lcom/vk/lists/PaginateHelper$Builder;->defaultNextFrom:Ljava/lang/String;

    invoke-direct/range {v0 .. v10}, Lcom/vk/lists/PaginateHelper;-><init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;Lcom/vk/lists/PaginateHelper$DataInfoProvider;Lcom/vk/lists/PaginateHelper$UIControl;Lcom/vk/lists/PreloadScrollListener;IZILjava/lang/String;Lcom/vk/lists/PaginateHelper$1;)V

    .line 460
    .local v0, "helper":Lcom/vk/lists/PaginateHelper;
    iget-boolean v1, p0, Lcom/vk/lists/PaginateHelper$Builder;->reloadOnBind:Z

    invoke-virtual {v0, p1, v1}, Lcom/vk/lists/PaginateHelper;->bind(Lcom/vk/lists/PaginateHelper$PaginatedView;Z)V

    .line 461
    return-object v0

    .end local v0    # "helper":Lcom/vk/lists/PaginateHelper;
    :cond_0
    move-object v5, v10

    .line 449
    goto :goto_0
.end method

.method public setDataInfoProvider(Lcom/vk/lists/PaginateHelper$DataInfoProvider;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "dataInfoProvider"    # Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .prologue
    .line 434
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 435
    return-object p0
.end method

.method public setDefaultNextFrom(Ljava/lang/String;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "nextFrom"    # Ljava/lang/String;

    .prologue
    .line 414
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->defaultNextFrom:Ljava/lang/String;

    .line 415
    return-object p0
.end method

.method public setDefaultOffset(I)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 419
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper$Builder;->defaultNextFrom:Ljava/lang/String;

    .line 420
    return-object p0
.end method

.method public setLoadingEnabledByDefault(Z)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "enabledByDefault"    # Z

    .prologue
    .line 404
    iput-boolean p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingEnabledByDefault:Z

    .line 405
    return-object p0
.end method

.method public setLoadingStartOffset(I)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "offset"    # I

    .prologue
    .line 399
    iput p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->loadingStartOffset:I

    .line 400
    return-object p0
.end method

.method public setPageSize(I)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "pageSize"    # I

    .prologue
    .line 409
    iput p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->pageSize:I

    .line 410
    return-object p0
.end method

.method public setPreloadCallback(Lcom/vk/lists/PreloadCallback;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "preloadCallback"    # Lcom/vk/lists/PreloadCallback;

    .prologue
    .line 439
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    .line 440
    return-object p0
.end method

.method public setPreloadCount(I)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "preloadCount"    # I

    .prologue
    .line 444
    iput p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->preloadCount:I

    .line 445
    return-object p0
.end method

.method public setReloadOnBind(Z)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "reloadOnBind"    # Z

    .prologue
    .line 424
    iput-boolean p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->reloadOnBind:Z

    .line 425
    return-object p0
.end method

.method public setUIControl(Lcom/vk/lists/PaginateHelper$UIControl;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 0
    .param p1, "uiControl"    # Lcom/vk/lists/PaginateHelper$UIControl;

    .prologue
    .line 429
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$Builder;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    .line 430
    return-object p0
.end method
