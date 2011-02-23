package ca.openlanguage.nlpgate

class ReadingSchedule {
	Date dueDate
	Date courseStartDate
	String sectionReference
	String citationReference
	String filename

    static constraints = {
		filename(blank:true, nullable:true)
    }
}
