.class public Lcom/patloew/rxlocation/Geocoding;
.super Ljava/lang/Object;
.source "Geocoding.java"


# static fields
.field private static final ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    invoke-static {}, Lcom/patloew/rxlocation/Geocoding$$Lambda$5;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    sput-object v0, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/patloew/rxlocation/Geocoding;->context:Landroid/content/Context;

    .line 37
    return-void
.end method

.method static synthetic lambda$fromLocation$1(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)Ljava/util/List;
    .locals 7
    .param p0, "this"    # Lcom/patloew/rxlocation/Geocoding;
    .param p1, "locale"    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "location"    # Landroid/location/Location;
    .param p3, "maxResults"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/Geocoding;->getGeocoder(Ljava/util/Locale;)Landroid/location/Geocoder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {p2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$fromLocation$2(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)Ljava/util/List;
    .locals 8
    .param p0, "this"    # Lcom/patloew/rxlocation/Geocoding;
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "latitude"    # D
    .param p4, "longitude"    # D
    .param p6, "maxResults"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/Geocoding;->getGeocoder(Ljava/util/Locale;)Landroid/location/Geocoder;

    move-result-object v1

    move-wide v2, p2

    move-wide v4, p4

    move v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$fromLocationName$3(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)Ljava/util/List;
    .locals 12
    .param p0, "this"    # Lcom/patloew/rxlocation/Geocoding;
    .param p1, "locale"    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "locationName"    # Ljava/lang/String;
    .param p3, "maxResults"    # I
    .param p4, "lowerLeftLatitude"    # D
    .param p6, "lowerLeftLongitude"    # D
    .param p8, "upperRightLatitude"    # D
    .param p10, "upperRightLongitude"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/Geocoding;->getGeocoder(Ljava/util/Locale;)Landroid/location/Geocoder;

    move-result-object v1

    move-object v2, p2

    move v3, p3

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    move-wide/from16 v10, p10

    invoke-virtual/range {v1 .. v11}, Landroid/location/Geocoder;->getFromLocationName(Ljava/lang/String;IDDDD)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$fromLocationName$4(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)Ljava/util/List;
    .locals 1
    .param p0, "this"    # Lcom/patloew/rxlocation/Geocoding;
    .param p1, "locale"    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "locationName"    # Ljava/lang/String;
    .param p3, "maxResults"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/Geocoding;->getGeocoder(Ljava/util/Locale;)Landroid/location/Geocoder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/location/Geocoder;->getFromLocationName(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$0(Ljava/util/List;)Lio/reactivex/Maybe;
    .locals 1
    .param p0, "addresses"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 31
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lio/reactivex/Maybe;->empty()Lio/reactivex/Maybe;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Maybe;->just(Ljava/lang/Object;)Lio/reactivex/Maybe;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public fromLocation(DD)Lio/reactivex/Maybe;
    .locals 7
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    const/4 v1, 0x0

    const/4 v6, 0x1

    move-object v0, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v0 .. v6}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;DDI)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Landroid/location/Location;)Lio/reactivex/Maybe;
    .locals 2
    .param p1, "location"    # Landroid/location/Location;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/location/Location;",
            ")",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;Landroid/location/Location;I)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Ljava/util/Locale;DD)Lio/reactivex/Maybe;
    .locals 8
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "latitude"    # D
    .param p4, "longitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "DD)",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;DDI)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Ljava/util/Locale;Landroid/location/Location;)Lio/reactivex/Maybe;
    .locals 2
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "location"    # Landroid/location/Location;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Landroid/location/Location;",
            ")",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;Landroid/location/Location;I)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(DDI)Lio/reactivex/Single;
    .locals 7
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 76
    const/4 v1, 0x0

    move-object v0, p0

    move-wide v2, p1

    move-wide v4, p3

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;DDI)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Landroid/location/Location;I)Lio/reactivex/Single;
    .locals 1
    .param p1, "location"    # Landroid/location/Location;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/location/Location;",
            "I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/patloew/rxlocation/Geocoding;->fromLocation(Ljava/util/Locale;Landroid/location/Location;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Ljava/util/Locale;DDI)Lio/reactivex/Single;
    .locals 2
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "latitude"    # D
    .param p4, "longitude"    # D
    .param p6, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "DDI)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 80
    invoke-static/range {p0 .. p6}, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Single;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocation(Ljava/util/Locale;Landroid/location/Location;I)Lio/reactivex/Single;
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "location"    # Landroid/location/Location;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Landroid/location/Location;",
            "I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 62
    invoke-static {p0, p1, p2, p3}, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Single;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/lang/String;)Lio/reactivex/Maybe;
    .locals 2
    .param p1, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;I)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/lang/String;DDDD)Lio/reactivex/Maybe;
    .locals 12
    .param p1, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "lowerLeftLatitude"    # D
    .param p4, "lowerLeftLongitude"    # D
    .param p6, "upperRightLatitude"    # D
    .param p8, "upperRightLongitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "DDDD)",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    const/4 v1, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-object v2, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    invoke-virtual/range {v0 .. v11}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;IDDDD)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/util/Locale;Ljava/lang/String;)Lio/reactivex/Maybe;
    .locals 2
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            ")",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;I)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/util/Locale;Ljava/lang/String;DDDD)Lio/reactivex/Maybe;
    .locals 13
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "lowerLeftLatitude"    # D
    .param p5, "lowerLeftLongitude"    # D
    .param p7, "upperRightLatitude"    # D
    .param p9, "upperRightLongitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            "DDDD)",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    invoke-virtual/range {v0 .. v11}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;IDDDD)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/Geocoding;->ADDRESS_MAYBE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/lang/String;I)Lio/reactivex/Single;
    .locals 1
    .param p1, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/lang/String;IDDDD)Lio/reactivex/Single;
    .locals 13
    .param p1, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "maxResults"    # I
    .param p3, "lowerLeftLatitude"    # D
    .param p5, "lowerLeftLongitude"    # D
    .param p7, "upperRightLatitude"    # D
    .param p9, "upperRightLongitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IDDDD)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 94
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    invoke-virtual/range {v0 .. v11}, Lcom/patloew/rxlocation/Geocoding;->fromLocationName(Ljava/util/Locale;Ljava/lang/String;IDDDD)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/util/Locale;Ljava/lang/String;I)Lio/reactivex/Single;
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            "I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 116
    invoke-static {p0, p1, p2, p3}, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Single;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public fromLocationName(Ljava/util/Locale;Ljava/lang/String;IDDDD)Lio/reactivex/Single;
    .locals 2
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locationName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "maxResults"    # I
    .param p4, "lowerLeftLatitude"    # D
    .param p6, "lowerLeftLongitude"    # D
    .param p8, "upperRightLatitude"    # D
    .param p10, "upperRightLongitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            "IDDDD)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 98
    invoke-static/range {p0 .. p11}, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Single;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method getGeocoder(Ljava/util/Locale;)Landroid/location/Geocoder;
    .locals 2
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 40
    if-eqz p1, :cond_0

    .line 41
    new-instance v0, Landroid/location/Geocoder;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 43
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/location/Geocoder;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method
