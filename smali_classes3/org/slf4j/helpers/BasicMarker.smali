.class public Lorg/slf4j/helpers/BasicMarker;
.super Ljava/lang/Object;
.source "BasicMarker.java"

# interfaces
.implements Lorg/slf4j/Marker;


# static fields
.field private static CLOSE:Ljava/lang/String; = null

.field private static OPEN:Ljava/lang/String; = null

.field private static SEP:Ljava/lang/String; = null

.field private static final serialVersionUID:J = 0x1908ed5291b507e7L


# instance fields
.field private final name:Ljava/lang/String;

.field private referenceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/slf4j/Marker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 131
    const-string/jumbo v0, "[ "

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->OPEN:Ljava/lang/String;

    .line 132
    const-string/jumbo v0, " ]"

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->CLOSE:Ljava/lang/String;

    .line 133
    const-string/jumbo v0, ", "

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->SEP:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    .line 47
    if-nez p1, :cond_0

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "A marker name cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_0
    iput-object p1, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    .line 51
    return-void
.end method


# virtual methods
.method public add(Lorg/slf4j/Marker;)V
    .locals 2
    .param p1, "reference"    # Lorg/slf4j/Marker;

    .prologue
    .line 58
    if-nez p1, :cond_0

    .line 59
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "A null value cannot be added to a Marker as reference."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    invoke-virtual {p0, p1}, Lorg/slf4j/helpers/BasicMarker;->contains(Lorg/slf4j/Marker;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 72
    :cond_1
    :goto_0
    return-void

    .line 66
    :cond_2
    invoke-interface {p1, p0}, Lorg/slf4j/Marker;->contains(Lorg/slf4j/Marker;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 70
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 113
    if-nez p1, :cond_0

    .line 114
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Other cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 117
    :cond_0
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 128
    :goto_0
    return v2

    .line 121
    :cond_1
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 122
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 123
    .local v1, "ref":Lorg/slf4j/Marker;
    invoke-interface {v1, p1}, Lorg/slf4j/Marker;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 128
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "ref":Lorg/slf4j/Marker;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public contains(Lorg/slf4j/Marker;)Z
    .locals 4
    .param p1, "other"    # Lorg/slf4j/Marker;

    .prologue
    const/4 v2, 0x1

    .line 91
    if-nez p1, :cond_0

    .line 92
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Other cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    :cond_0
    invoke-virtual {p0, p1}, Lorg/slf4j/helpers/BasicMarker;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 106
    :goto_0
    return v2

    .line 99
    :cond_1
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 100
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 101
    .local v1, "ref":Lorg/slf4j/Marker;
    invoke-interface {v1, p1}, Lorg/slf4j/Marker;->contains(Lorg/slf4j/Marker;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 106
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "ref":Lorg/slf4j/Marker;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 136
    if-ne p0, p1, :cond_1

    .line 137
    const/4 v1, 0x1

    .line 144
    :cond_0
    :goto_0
    return v1

    .line 138
    :cond_1
    if-eqz p1, :cond_0

    .line 140
    instance-of v2, p1, Lorg/slf4j/Marker;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 143
    check-cast v0, Lorg/slf4j/Marker;

    .line 144
    .local v0, "other":Lorg/slf4j/Marker;
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-interface {v0}, Lorg/slf4j/Marker;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hasChildren()Z
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v0

    return v0
.end method

.method public hasReferences()Z
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/slf4j/Marker;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lorg/slf4j/Marker;)Z
    .locals 1
    .param p1, "referenceToRemove"    # Lorg/slf4j/Marker;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->referenceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 152
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-nez v3, :cond_0

    .line 153
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->getName()Ljava/lang/String;

    move-result-object v3

    .line 168
    :goto_0
    return-object v3

    .line 155
    :cond_0
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 157
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/slf4j/Marker;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/slf4j/helpers/BasicMarker;->OPEN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 160
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 161
    .local v1, "reference":Lorg/slf4j/Marker;
    invoke-interface {v1}, Lorg/slf4j/Marker;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 163
    sget-object v3, Lorg/slf4j/helpers/BasicMarker;->SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 166
    .end local v1    # "reference":Lorg/slf4j/Marker;
    :cond_2
    sget-object v3, Lorg/slf4j/helpers/BasicMarker;->CLOSE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method
