.class public final Lru/mail/libverify/requests/response/PushStatusApiResponse;
.super Lru/mail/libverify/requests/response/ClientApiResponseBase;


# instance fields
.field private fetcher_info:Lru/mail/libverify/requests/response/FetcherInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;-><init>()V

    return-void
.end method


# virtual methods
.method public final getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/response/PushStatusApiResponse;->fetcher_info:Lru/mail/libverify/requests/response/FetcherInfo;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PushStatusApiResponse{fetcher_info="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/requests/response/PushStatusApiResponse;->fetcher_info:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
