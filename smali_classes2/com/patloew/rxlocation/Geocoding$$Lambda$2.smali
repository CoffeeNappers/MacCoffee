.class final synthetic Lcom/patloew/rxlocation/Geocoding$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/Geocoding;

.field private final arg$2:Ljava/util/Locale;

.field private final arg$3:D

.field private final arg$4:D

.field private final arg$5:I


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iput-object p2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$2:Ljava/util/Locale;

    iput-wide p3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$3:D

    iput-wide p5, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$4:D

    iput p7, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$5:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)Ljava/util/concurrent/Callable;
    .locals 10

    new-instance v1, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide v6, p4

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;-><init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)V

    return-object v1
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$2:Ljava/util/Locale;

    iget-wide v2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$3:D

    iget-wide v4, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$4:D

    iget v6, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$2;->arg$5:I

    invoke-static/range {v0 .. v6}, Lcom/patloew/rxlocation/Geocoding;->lambda$fromLocation$2(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;DDI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
