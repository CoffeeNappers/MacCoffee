.class final synthetic Lcom/patloew/rxlocation/Geocoding$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/Geocoding;

.field private final arg$2:Ljava/util/Locale;

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:I

.field private final arg$5:D

.field private final arg$6:D

.field private final arg$7:D

.field private final arg$8:D


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iput-object p2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$2:Ljava/util/Locale;

    iput-object p3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$3:Ljava/lang/String;

    iput p4, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$4:I

    iput-wide p5, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$5:D

    iput-wide p7, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$6:D

    iput-wide p9, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$7:D

    iput-wide p11, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$8:D

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)Ljava/util/concurrent/Callable;
    .locals 14

    new-instance v1, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move/from16 v5, p3

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    move-wide/from16 v12, p10

    invoke-direct/range {v1 .. v13}, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;-><init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)V

    return-object v1
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 12

    iget-object v0, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$2:Ljava/util/Locale;

    iget-object v2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$3:Ljava/lang/String;

    iget v3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$4:I

    iget-wide v4, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$5:D

    iget-wide v6, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$6:D

    iget-wide v8, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$7:D

    iget-wide v10, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$3;->arg$8:D

    invoke-static/range {v0 .. v11}, Lcom/patloew/rxlocation/Geocoding;->lambda$fromLocationName$3(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;IDDDD)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
